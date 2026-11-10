#!/bin/bash

set -euo pipefail

# Script de verificación de salud para la infraestructura del servicio de notificaciones
# Verifica que los recursos críticos estén correctamente aprovisionados

REGION="${AWS_REGION:-us-east-1}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
PROJECT_NAME="notificaciones"
STACK_NAME="${PROJECT_NAME}-${ENVIRONMENT}"

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar que AWS CLI esté disponible
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        log_error "AWS CLI no está instalado"
        exit 1
    fi
    log_info "AWS CLI disponible"
}

# Verificar credenciales de AWS
check_credentials() {
    if ! aws sts get-caller-identity &> /dev/null; then
        log_error "Credenciales de AWS no configuradas"
        exit 1
    fi
    log_info "Credenciales de AWS configuradas"
}

# Verificar estado de instancias EC2
check_ec2_instances() {
    log_info "Verificando instancias EC2..."
    
    local instance_ids
    instance_ids=$(aws ec2 describe-instances \
        --filters "Name=tag:Project,Values=${PROJECT_NAME}" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text \
        --region "$REGION" 2>/dev/null || echo "")
    
    if [ -z "$instance_ids" ]; then
        log_warn "No se encontraron instancias EC2 para el proyecto"
        return 1
    fi
    
    local running_count=0
    local total_count=0
    
    for instance_id in $instance_ids; do
        total_count=$((total_count + 1))
        local instance_state
        instance_state=$(aws ec2 describe-instance-status \
            --instance-ids "$instance_id" \
            --query 'InstanceStatuses[].InstanceState.Name' \
            --output text \
            --region "$REGION" 2>/dev/null || echo "stopped")
        
        if [ "$instance_state" == "running" ]; then
            running_count=$((running_count + 1))
            log_info "Instancia $instance_id en estado: $instance_state"
        else
            log_warn "Instancia $instance_id en estado: $instance_state"
        fi
    done
    
    if [ "$running_count" -eq "$total_count" ]; then
        log_info "Todas las instancias ($running_count) están ejecutándose"
        return 0
    else
        log_error "Solo $running_count de $total_count instancias están ejecutándose"
        return 1
    fi
}

# Verificar security groups
check_security_groups() {
    log_info "Verificando security groups..."
    
    local sg_name="${PROJECT_NAME}-sg-${ENVIRONMENT}"
    local sg_id
    sg_id=$(aws ec2 describe-security-groups \
        --filters "Name=group-name,Values=${sg_name}" \
        --query 'SecurityGroups[].GroupId' \
        --output text \
        --region "$REGION" 2>/dev/null || echo "")
    
    if [ -z "$sg_id" ]; then
        log_error "Security group ${sg_name} no encontrado"
        return 1
    fi
    
    log_info "Security group encontrado: $sg_id"
    
    # Verificar reglas de entrada
    local ingress_count
    ingress_count=$(aws ec2 describe-security-groups \
        --group-ids "$sg_id" \
        --query 'SecurityGroups[].IpPermissions[].FromPort' \
        --output text \
        --region "$REGION" 2>/dev/null | wc -l)
    
    if [ "$ingress_count" -gt 0 ]; then
        log_info "Security group tiene $ingress_count reglas de entrada configuradas"
        return 0
    else
        log_warn "Security group no tiene reglas de entrada"
        return 1
    fi
}

# Verificar conectividad a instancias
check_instance_connectivity() {
    log_info "Verificando conectividad a instancias..."
    
    local private_ips
    private_ips=$(aws ec2 describe-instances \
        --filters "Name=tag:Project,Values=${PROJECT_NAME}" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
                  "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].PrivateIpAddress' \
        --output text \
        --region "$REGION" 2>/dev/null || echo "")
    
    if [ -z "$private_ips" ]; then
        log_warn "No hay instancias running para verificar conectividad"
        return 1
    fi
    
    local connected=0
    local total=0
    
    for ip in $private_ips; do
        total=$((total + 1))
        # Verificar si el puerto 22 (SSH) está abierto
        if timeout 5 bash -c "echo >/dev/tcp/$ip/22" 2>/dev/null; then
            connected=$((connected + 1))
            log_info "Conectividad verificada a $ip:22"
        else
            log_warn "No se puede conectar a $ip:22"
        fi
    done
    
    if [ "$connected" -gt 0 ]; then
        log_info "$connected de $total instancias accesibles"
        return 0
    else
        log_error "Ninguna instancia es accesible"
        return 1
    fi
}

# Verificar estado de Terraform
check_terraform_state() {
    log_info "Verificando estado de Terraform..."
    
    if [ ! -f "terraform.tfstate" ]; then
        log_warn "No se encuentra archivo de estado local"
        return 1
    fi
    
    local state_version
    state_version=$(terraform version -json 2>/dev/null | grep -o '"version":"[^"]*"' || echo "unknown")
    log_info "Terraform state disponible"
    return 0
}

# Verificar recursos de red
check_network_resources() {
    log_info "Verificando recursos de red..."
    
    # Verificar VPC
    local vpc_id
    vpc_id=$(aws ec2 describe-vpcs \
        --filters "Name=tag:Project,Values=${PROJECT_NAME}" \
        --query 'Vpcs[].VpcId' \
        --output text \
        --region "$REGION" 2>/dev/null || echo "")
    
    if [ -z "$vpc_id" ]; then
        log_error "VPC del proyecto no encontrada"
        return 1
    fi
    
    log_info "VPC encontrada: $vpc_id"
    
    # Verificar subnets
    local subnet_count
    subnet_count=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'Subnets[].SubnetId' \
        --output text \
        --region "$REGION" 2>/dev/null | wc -l)
    
    if [ "$subnet_count" -lt 2 ]; then
        log_error "Se esperan al menos 2 subnets, encontradas: $subnet_count"
        return 1
    fi
    
    log_info "Subnets configuradas: $subnet_count"
    return 0
}

# Verificar IAM roles
check_iam_roles() {
    log_info "Verificando roles IAM..."
    
    local role_name="${PROJECT_NAME}-ec2-role-${ENVIRONMENT}"
    
    if aws iam get-role --role-name "$role_name" &> /dev/null; then
        log_info "Rol IAM $role_name existe"
        return 0
    else
        log_error "Rol IAM $role_name no encontrado"
        return 1
    fi
}

# Resumen final
print_summary() {
    local failed_checks=$1
    
    echo ""
    echo "========================================"
    echo "         RESUMEN DE VERIFICACIÓN        "
    echo "========================================"
    
    if [ "$failed_checks" -eq 0 ]; then
        log_info "Todas las verificaciones pasaron correctamente"
        echo "========================================"
        exit 0
    else
        log_error "$failed_checks verificación(es) fallida(s)"
        echo "========================================"
        exit 1
    fi
}

# Función principal
main() {
    log_info "Iniciando healthcheck para ${STACK_NAME}"
    log_info "Región: ${REGION}, Ambiente: ${ENVIRONMENT}"
    echo ""
    
    local failed_checks=0
    
    # Verificaciones previas
    check_aws_cli || ((failed_checks++))
    check_credentials || ((failed_checks++))
    check_terraform_state || ((failed_checks++))
    
    # Verificaciones de infraestructura
    check_network_resources || ((failed_checks++))
    check_security_groups || ((failed_checks++))
    check_ec2_instances || ((failed_checks++))
    check_instance_connectivity || ((failed_checks++))
    check_iam_roles || ((failed_checks++))
    
    print_summary "$failed_checks"
}

main "$@"
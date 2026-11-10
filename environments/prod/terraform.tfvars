# ============================================================
# Variables de infraestructura - Ambiente de PRODUCCIÓN
# Servicio de Notificaciones - Banca Digital
# ============================================================

# Configuración general del ambiente
environment           = "prod"
region                = "us-east-1"

# Prefijo del proyecto para nomenclatura de recursos
project_name          = "notificaciones-banca"

# Configuración de red - VPC
# Producción: bloque CIDR más amplio para escalar
vpc_cidr              = "10.1.0.0/16"
availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Subnets - rango privado para aplicaciones
# Tres subnets privadas en diferentes AZs para alta disponibilidad y tolerancia a fallos
private_subnet_cidrs  = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]

# Subnets públicas para NAT Gateway y balanceador
public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]

# Configuración de cómputo - EC2 / ECS
# Producción: instancias optimizadas para producción
instance_type         = "t3.large"
instance_count        = 4

# AMI: Amazon Linux 2023 - última versión estable
ami_id                = "ami-0c55b159cbfafe1f0"

# Configuración de auto-scaling
# Producción: mayor capacidad de escalamiento
min_instances         = 4
max_instances         = 12
target_cpu_utilization = 65

# Configuración de seguridad
enable_flow_logs      = true
enable_deletion_protection = true  # Prod: protección activa contra eliminación accidental

# Tags obligatorios para todos los recursos
tags = {
  Environment       = "production"
  Project           = "notificaciones-banca"
  ManagedBy         = "terraform"
  CostCenter        = "plataforma-banca"
  Compliance        = "pci-dss"
  Owner             = "equipo-devops"
  MissionCritical   = "true"
  RTO                = "4h"
  RPO                = "1h"
}

# Configuración de logs y monitoreo
# Producción: retención más larga para auditoría y troubleshooting
log_retention_days    = 90
enable_detailed_monitoring = true

# Configuración de base de datos - RDS
# Producción: instancia mayor con Multi-AZ para alta disponibilidad
db_instance_class    = "db.r6g.large"
db_allocated_storage = 100
db_multi_az          = true
db_skip_final_snapshot = false
db_final_snapshot_identifier = "notificaciones-banca-prod-final-snapshot"

# Configuración de caché - ElastiCache
# Producción: cluster con réplicas para alta disponibilidad
cache_node_type      = "cache.r6g.large"
cache_num_nodes      = 2
cache_replica_count  = 2

# Configuración de balanceador de carga
# Producción: mayor capacidad y redundancia
lb_type              = "application"
lb_scheme           = "internet-facing"
lb_enable_deletion_protection = true

# Configuración de WAF para protección
enable_waf           = true
waf_rules = [
  "AWSManagedRulesCommonRuleSet",
  "AWSManagedRulesKnownBadInputsRuleSet",
  "AWSManagedRulesSQLiRuleSet",
  "AWSManagedRulesLinuxRuleSet"
]
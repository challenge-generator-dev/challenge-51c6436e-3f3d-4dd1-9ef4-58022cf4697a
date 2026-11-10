# ============================================================
# Variables de infraestructura - Ambiente de DESARROLLO
# Servicio de Notificaciones - Banca Digital
# ============================================================

# Configuración general del ambiente
environment           = "dev"
region                = "us-east-1"

# Prefijo del proyecto para nomenclatura de recursos
project_name          = "notificaciones-banca"

# Configuración de red - VPC
vpc_cidr              = "10.0.0.0/16"
availability_zones    = ["us-east-1a", "us-east-1b"]

# Subnets - rango privado para aplicaciones
# Dos subnets privadas en diferentes AZs para alta disponibilidad
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.20.0/24"]

# Subnets públicas para NAT Gateway y balanceador
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]

# Configuración de cómputo - EC2 / ECS
# Instancias de desarrollo: tipo económico para pruebas
instance_type         = "t3.medium"
instance_count        = 2

# AMI: Amazon Linux 2023 - última versión estable
ami_id                = "ami-0c55b159cbfafe1f0"

# Configuración de auto-scaling
min_instances         = 2
max_instances         = 4
target_cpu_utilization = 70

# Configuración de seguridad
enable_flow_logs      = true
enable_deletion_protection = false  # Dev: sin protección para facilitar limpieza

# Tags obligatorios para todos los recursos
tags = {
  Environment       = "development"
  Project           = "notificaciones-banca"
  ManagedBy         = "terraform"
  CostCenter        = "plataforma-banca"
  Compliance        = "pci-dss"
  Owner             = "equipo-devops"
}

# Configuración de logs y monitoreo
log_retention_days    = 7
enable_detailed_monitoring = false

# Configuración de base de datos - RDS
# Desarrollo: instancia pequeña, sin replicación
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_multi_az          = false
db_skip_final_snapshot = true

# Configuración de caché - ElastiCache
# Desarrollo: nodo único económico
cache_node_type      = "cache.t3.micro"
cache_num_nodes      = 1
# Valores por defecto para las variables de Terraform
# NOTA: Este archivo contiene valores sensibles y debe excluirse del versionado

aws_region         = "us-east-1"
environment        = "dev"
project_name       = "notificaciones"

# Configuración de red
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]

# Configuración de cómputo
instance_type      = "t3.micro"
ami_id             = "ami-0c55b159cbfafe1f0"
key_name           = "notificaciones-key"
desired_capacity   = 2
min_size           = 1
max_size           = 4

# Configuración de etiquetas
tags = {
  Environment = "dev"
  Project     = "notificaciones"
  ManagedBy   = "terraform"
}
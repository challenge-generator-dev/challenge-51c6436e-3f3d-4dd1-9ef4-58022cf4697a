# Configuración principal de infraestructura para el servicio de notificaciones
# Este archivo define los recursos de red y cómputo necesarios

terraform {
  required_version = ">= 1.5"
}

# Referencia al proveedor configurado en providers.tf
provider "aws" {
  region = var.aws_region
}

# Módulo de red - VPC, subnets, route tables
module "network" {
  source = "./modules/network"

  environment           = var.environment
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

# Módulo de cómputo - EC2, security groups, IAM
module "compute" {
  source = "./modules/compute"

  environment           = var.environment
  project_name          = var.project_name
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  instance_type         = var.instance_type
  ami_id                = var.ami_id
  key_name              = var.key_name
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
}
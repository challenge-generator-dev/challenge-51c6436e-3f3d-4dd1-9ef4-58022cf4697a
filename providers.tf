terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del provider AWS
provider "aws" {
  region = var.aws_region

  # Configuración para evitar cambios accidentales en recursos críticos
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      Terraform   = "true"
    }
  }
}

# Backend para almacenamiento del estado (se configura en el backend.tf)
# Ejemplo de configuración que se completaría en la fase 2:
# terraform {
#   backend "s3" {
#     bucket         = "tf-state-bucket"
#     key            = "notification-service/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "tf-state-lock"
#   }
# }
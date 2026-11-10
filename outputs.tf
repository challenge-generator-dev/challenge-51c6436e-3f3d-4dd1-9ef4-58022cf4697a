# Definición de salidas para exponer información crítica de la infraestructura
# Estas salidas permiten la integración con otros sistemas y módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = module.compute.instance_ids
}

output "instance_public_ips" {
  description = "IPs públicas de las instancias (solo para entornos de desarrollo)"
  value       = var.environment == "dev" ? module.compute.instance_public_ips : []
}

output "security_group_id" {
  description = "ID del security group aplicado a las instancias"
  value       = module.compute.security_group_id
}

output "load_balancer_dns" {
  description = "DNS del balanceador de carga"
  value       = module.compute.load_balancer_dns
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}
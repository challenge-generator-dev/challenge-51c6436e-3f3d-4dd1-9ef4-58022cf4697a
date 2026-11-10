# Outputs del módulo de cómputo para el servicio de notificaciones
# Superficie de práctica: el estudiante debe definir las salidas necesarias

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notification_service[*].id
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notification_service[*].private_ip
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notification_service[*].public_ip
}

output "security_group_id" {
  description = "ID del security group para el servicio de notificaciones"
  value       = aws_security_group.notification_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notification_profile.name
}

output "ami_id" {
  description = "ID de la AMI utilizada"
  value       = var.ami_id
}

output "instance_arns" {
  description = "ARNs de las instancias EC2"
  value       = aws_instance.notification_service[*].arn
}
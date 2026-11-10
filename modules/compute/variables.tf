# Variables específicas para el módulo de cómputo

variable "project_name" {
  description = "Nombre del proyecto para prefijar recursos"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue (dev, staging, prod)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check en segundos"
  type        = number
}

variable "notification_service_port" {
  description = "Puerto expuesto por el servicio de notificaciones"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el servicio"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes donde se desplegará el servicio"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups asociados al servicio"
  type        = list(string)
}

variable "ami_id" {
  description = "ID de la AMI para las instancias"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 en us-east-1
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
}

variable "user_data" {
  description = "Script de user data para configurar las instancias"
  type        = string
  default     = ""
}

variable "load_balancer_type" {
  description = "Tipo de load balancer"
  type        = string
  default     = "application"
}

variable "target_group_port" {
  description = "Puerto del target group"
  type        = number
  default     = 8080
}

variable "target_group_protocol" {
  description = "Protocolo del target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Ruta para el health check"
  type        = string
  default     = "/health"
}

variable "health_check_interval" {
  description = "Intervalo entre health checks en segundos"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout para el health check en segundos"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Umbral de health checks exitosos para considerar la instancia saludable"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Umbral de health checks fallidos para considerar la instancia no saludable"
  type        = number
  default     = 2
}
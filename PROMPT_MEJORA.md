# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos que la arquitectura del reto declara y no estan

Creálos con implementacion real, en la capa que les corresponde:

- `README.md`

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109184921254), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionado de Infraestructura del Servicio de Notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Configurar el entorno de Terraform y definir la infraestructura básica. — entregable (NO resolver): Archivo de configuración de Terraform que define la red y el cómputo para el servicio de notificaciones.
- Fase 2: Implementación de la Infraestructura — objetivo: Implementar la infraestructura definida en la fase anterior. — entregable (NO resolver): Infraestructura desplegada en la nube y documentación de problemas encontrados y resoluciones.
- Fase 3: Versionado de la Infraestructura — objetivo: Versionar la configuración de Terraform en un repositorio de código. — entregable (NO resolver): Repositorio de código con la configuración de Terraform versionada y protegida.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Variables globales para la infraestructura del servicio de notificaciones
# Estas variables deben ser definidas en terraform.tfvars o pasadas via CLI/entorno

variable "project_name" {
  description = "Nombre del proyecto para prefijar recursos"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue (dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC principal"
  type        = string
}

variable "public_subnets" {
  description = "Lista de CIDRs para subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs para subredes privadas"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check en segundos"
  type        = number
  default     = 300
}

variable "notification_service_port" {
  description = "Puerto expuesto por el servicio de notificaciones"
  type        = number
  default     = 8080
}

// === ARCHIVO: providers.tf ===
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

// === ARCHIVO: modules/network/variables.tf ===
# Variables específicas para el módulo de red

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de CIDRs para subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs para subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Zonas de disponibilidad donde desplegar las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Crear un NAT Gateway por zona de disponibilidad"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Habilitar nombres de host DNS para la VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Habilitar soporte DNS para la VPC"
  type        = bool
  default     = true
}

// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: main.tf ===
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

// === ARCHIVO: outputs.tf ===
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

// === ARCHIVO: terraform.tfvars ===
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

// === ARCHIVO: .gitignore ===
# Terraform local state and logs
*.tfstate
*.tfstate.*
*.log
*.tfplan
*.tfvars.backup

# Terraform directories
.terraform/
.terraform.lock.hcl

# Provider plugins cache
.terraform.d/

# Sensitive variable files - nunca versionar
*..auto.tfvars
*.auto.tfvars.json

# Environment-specific overrides (usar environments/ en su lugar)
# Descomentar solo si es necesario para desarrollo local temporal
# dev.tfvars
# prod.tfvars

# Backup files
*.backup
*.bak
*~

# IDE and editor files
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Secrets and credentials - NUNCA versionar
*.pem
*.key
*.crt
credentials.json
aws_credentials*
*secret*
*password*
*.p12

# Build artifacts
dist/
build/

# Temporary files
tmp/
temp/
.cache/

# CI/CD pipeline artifacts
*.zip
*.tar.gz

# Documentation generated files
site/

# Python virtual environments (si aplica)
venv/
env/
.venv/

# Node modules (si aplica)
node_modules/

# Misc
*.tmp
.env
.env.local

// === ARCHIVO: environments/dev/terraform.tfvars ===
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

// === ARCHIVO: environments/prod/terraform.tfvars ===
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

// === ARCHIVO: modules/network/main.tf ===
# Módulo de configuración de red para el servicio de notificaciones
# Proporciona VPC, subnets, tablas de rutas y componentes de red relacionados

# VPC principal del servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-vpc"
    }
  )
}

# Subnets públicas para recursos expuestos
resource "aws_subnet" "public" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
      Type = "public"
    }
  )
}

# Subnets privadas para instancias de aplicación
resource "aws_subnet" "private" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-private-subnet-${count.index + 1}"
      Type = "private"
    }
  )
}

# Internet Gateway para conectividad externa
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-igw"
    }
  )
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-public-rt"
    }
  )
}

# Asociación de subnets públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# NAT Gateway para conectividad saliente desde subnets privadas
resource "aws_nat_gateway" "main" {
  count = var.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-nat-gw"
    }
  )

  depends_on = [aws_internet_gateway.main]
}

# Elastic IP para NAT Gateway
resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-nat-eip"
    }
  )
}

# Tabla de rutas privada con NAT Gateway
resource "aws_route_table" "private" {
  count = var.enable_nat_gateway ? 1 : 0

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[0].id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-private-rt"
    }
  )
}

// === ARCHIVO: modules/network/outputs.tf ===
# Salidas del módulo de red para consumo por otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.private[*].id
}

output "public_subnet_cidrs" {
  description = "Bloques CIDR de las subnets públicas"
  value       = aws_subnet.public[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "Bloques CIDR de las subnets privadas"
  value       = aws_subnet.private[*].cidr_block
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "ID del NAT Gateway (null si no está habilitado)"
  value       = var.enable_nat_gateway ? aws_nat_gateway.main[0].id : null
}

output "nat_gateway_ip" {
  description = "IP elástica del NAT Gateway (null si no está habilitado)"
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : null
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID de la tabla de rutas privada (null si NAT no está habilitado)"
  value       = var.enable_nat_gateway ? aws_route_table.private[0].id : null
}

output "availability_zones" {
  description = "Zonas de disponibilidad utilizadas"
  value       = var.availability_zones
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de configuración de cómputo para el servicio de notificaciones
# Proporciona instancias EC2, security groups y componentes de cómputo relacionados

# Security Group para las instancias del servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project_name}-${var.environment}-compute-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = var.vpc_id

  # Tráfico entrante permitido
  dynamic "ingress" {
    for_each = var.allowed_inbound_cidrs
    content {
      from_port   = var.service_port
      to_port     = var.service_port
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Allow inbound traffic on service port"
    }
  }

  # Tráfico saliente permitido
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-notifications-sg"
    }
  )
}

# Security Group para ELB (si está habilitado)
resource "aws_security_group" "elb" {
  count = var.enable_elb ? 1 : 0

  name        = "${var.project_name}-${var.environment}-elb-sg"
  description = "Security group para el balanceador de carga"
  vpc_id      = var.vpc_id

  # Tráfico HTTP entrante
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_inbound_cidrs
    description = "Allow HTTP inbound"
  }

  # Tráfico HTTPS entrante
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_inbound_cidrs
    description = "Allow HTTPS inbound"
  }

  # Tráfico saliente hacia las instancias
  egress {
    from_port       = var.service_port
    to_port         = var.service_port
    protocol        = "tcp"
    security_groups = [aws_security_group.notifications.id]
    description     = "Allow traffic to service instances"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-elb-sg"
    }
  )
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notifications" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [aws_security_group.notifications.id]
  key_name               = var.key_name
  user_data              = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.encrypt_root_volume
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-notifications-${count.index + 1}"
    }
  )
}

# Optional: Application Load Balancer
resource "aws_lb" "main" {
  count = var.enable_elb ? 1 : 0

  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb[0].id]
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-alb"
    }
  )
}

# Target Group para el ALB
resource "aws_lb_target_group" "main" {
  count = var.enable_elb ? 1 : 0

  name     = "${var.project_name}-${var.environment}-tg"
  port     = var.service_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = var.health_check_path
    matcher             = "200"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-tg"
    }
  )
}

# Listener para el ALB
resource "aws_lb_listener" "http" {
  count = var.enable_elb ? 1 : 0

  load_balancer_arn = aws_lb.main[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }
}

# Attachment de instancias al Target Group
resource "aws_lb_target_group_attachment" "main" {
  count = var.enable_elb ? var.instance_count : 0

  target_group_arn = aws_lb_target_group.main[0].arn
  target_id        = aws_instance.notifications[count.index].id
  port             = var.service_port
}

# Auto Scaling Group (opcional)
resource "aws_autoscaling_group" "main" {
  count = var.enable_autoscaling ? 1 : 0

  name                = "${var.project_name}-${var.environment}-asg"
  vpc_zone_identifier = var.subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity   = var.desired_capacity
  health_check_type   = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.main[0].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-asg-instance"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

# Launch Template para ASG
resource "aws_launch_template" "main" {
  count = var.enable_autoscaling ? 1 : 0

  name_prefix   = "${var.project_name}-${var.environment}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = base64encode(var.user_data)

  vpc_security_group_ids = [aws_security_group.notifications.id]

  monitoring {
    enabled = true
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.encrypt_root_volume
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name = "${var.project_name}-${var.environment}-lt-instance"
      }
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}

// === ARCHIVO: modules/compute/outputs.tf ===
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

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: Dockerfile ===
# Dockerfile multi-stage para el servicio de notificaciones
# Stage 1: Build - compila la aplicación
FROM node:20-alpine AS builder

WORKDIR /build

# Copiar package files para optimizar caché
COPY package*.json ./

# Instalar dependencias de producción
RUN npm ci --only=production

# Copiar código fuente
COPY src/ ./src/
COPY dist/ ./dist/ 2>/dev/null || true

# Stage 2: Runtime - imagen final optimizada
FROM node:20-alpine AS runtime

# Crear usuario no root para seguridad
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo lo necesario del stage de build
COPY --from=builder --chown=nodejs:nodejs /build/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /build/package*.json ./
COPY --from=builder --chown=nodejs:nodejs /build/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /build/src ./src

# Configurar variables de entorno
ENV NODE_ENV=production \
    PORT=8080 \
    NOTIFICATION_SERVICE_NAME=notification-service \
    AWS_REGION=us-east-1

# Exponer puerto del servicio
EXPOSE 8080

# Cambiar a usuario no root
USER nodejs

# Healthcheck para orquestación
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD node -e "require('http').get('http://localhost:8080/health', (r) => process.exit(r.statusCode === 200 ? 0 : 1))" || exit 1

# Comando de inicio
CMD ["node", "dist/index.js"]
```

# Versionado de Infraestructura del Servicio de Notificaciones

El equipo de DevOps necesita aprovisionar la infraestructura del servicio de notificaciones utilizando Terraform. El dominio es una plataforma de notificaciones para un servicio de banca digital. Los actores involucrados son el equipo de desarrollo, el equipo de operaciones y los usuarios finales del servicio de notificaciones. La infraestructura debe incluir la red y el cómputo necesarios para el servicio. Se espera que el candidato versione la infraestructura utilizando Terraform y garantice que la configuración sea idempotente y reproducible.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y definir la infraestructura básica.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configura el entorno de Terraform para trabajar con la nube seleccionada (AWS, Azure, GCP).
- Define la red y el cómputo necesarios para el servicio de notificaciones.
- Asegura que la configuración sea idempotente y reproducible.

**Entregable:** Archivo de configuración de Terraform que define la red y el cómputo para el servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Importancia de la idempotencia en la configuración de infraestructura.
- Prácticas recomendadas para la organización de archivos de Terraform.

</details>

### Fase 2: Implementación de la Infraestructura

**Objetivo:** Implementar la infraestructura definida en la fase anterior.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecuta los comandos de Terraform para aplicar la configuración definida.
- Verifica que la infraestructura se haya desplegado correctamente.
- Documenta cualquier problema encontrado y cómo lo resolviste.

**Entregable:** Infraestructura desplegada en la nube y documentación de problemas encontrados y resoluciones.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de comandos de Terraform para aplicar y verificar la configuración.
- Importancia de la documentación en el proceso de implementación.

</details>

### Fase 3: Versionado de la Infraestructura

**Objetivo:** Versionar la configuración de Terraform en un repositorio de código.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crea un repositorio de código para almacenar la configuración de Terraform.
- Versiona la configuración de Terraform en el repositorio.
- Asegura que el repositorio esté configurado para proteger la rama principal y requerir revisiones por pares.

**Entregable:** Repositorio de código con la configuración de Terraform versionada y protegida.

<details>
<summary>Pistas de conocimiento</summary>

- Prácticas recomendadas para el versionado de código.
- Configuración de protección de ramas y revisiones por pares en GitHub.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y por qué se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la configuración de Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para implementar la infraestructura?
- **erroresComunes**: ¿Cuáles son los errores comunes al trabajar con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionado de la configuración de Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform correctamente definida.
- Infraestructura desplegada correctamente y documentada.
- Configuración de Terraform versionada y protegida en un repositorio de código.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*

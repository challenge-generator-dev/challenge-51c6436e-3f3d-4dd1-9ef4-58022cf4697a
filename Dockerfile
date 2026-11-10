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
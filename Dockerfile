# =============================================
# STAGE 1: Build
# =============================================
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# =============================================
# STAGE 2: Serve con Nginx
# =============================================
FROM nginx:alpine AS production

# Copiamos el build de React
COPY --from=builder /app/dist /usr/share/nginx/html

# Configuración de Nginx para React Router en puerto 8080 (para poder correr como usuario no-root)
RUN echo 'server { \
    listen 8080; \
    location / { \
    root /usr/share/nginx/html; \
    index index.html; \
    try_files $uri $uri/ /index.html; \
    } \
    }' > /etc/nginx/conf.d/default.conf

# Ajustar permisos para que el usuario nginx pueda escribir en directorios requeridos por Nginx
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx/conf.d

USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
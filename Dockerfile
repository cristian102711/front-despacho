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

# Configuración de Nginx para React Router
RUN echo 'server { \
    listen 80; \
    location / { \
    root /usr/share/nginx/html; \
    index index.html; \
    try_files $uri $uri/ /index.html; \
    } \
    }' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# 🚀 Front Despacho — ITPCargo

Frontend de la plataforma de gestión de despachos **ITPCargo**, desarrollado en React con Tailwind CSS y contenedorizado con Docker.

## 📋 Descripción

Aplicación web que permite gestionar órdenes de compra y despacho, visualizar el estado de los pedidos y administrar usuarios y productos.

## 🛠️ Tecnologías

- React 18
- Tailwind CSS
- Docker (multi-stage build)
- GitHub Actions (CI/CD)

## 🐳 Ejecutar con Docker

```bash
docker pull cristian102711/front-despacho:latest
docker run -p 80:80 cristian102711/front-despacho:latest
```

Acceder en: http://localhost

## 🔧 Ejecutar localmente con Docker Compose

```bash
docker compose up --build
```

## ⚙️ Pipeline CI/CD

Cada push a la rama `deploy` activa automáticamente el pipeline de GitHub Actions que:

1. Construye la imagen Docker
2. Publica en Docker Hub
3. Despliega en EC2

## 👤 Autor

Cristian Velásquez — [github.com/cristian102711](https://github.com/cristian102711)
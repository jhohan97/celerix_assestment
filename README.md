# Reto Celerix - Infraestructura como Código (IaC)

Este proyecto contiene la definición de infraestructura necesaria para desplegar una arquitectura escalable y segura en AWS utilizando **Terraform**. La solución está diseñada siguiendo las mejores prácticas de modularización y segregación de entornos.

## 🚀 Descripción del Proyecto

El objetivo de este repositorio es automatizar el aprovisionamiento de recursos de red y bases de datos, permitiendo un despliegue consistente en múltiples ambientes (Desarrollo, Test y Producción).

## 🚀 Descripción del Proyecto

Para la ejecucion de la infraestructura refierace al redme que se encuentra en la ruta infra/Terraform/readme.md

## 📂 Estructura del Proyecto

```text
.
├── infra/
│   └── Terraform/
│       ├── main.tf            # Orquestación principal de módulos
│       ├── variables.tf       # Variables globales del proyecto
│       ├── outputs.tf         # Salidas generales (VPC IDs, Endpoints, etc.)
│       ├── modules/           # Módulos internos reutilizables
│       │   ├── Networking/    # Configuración de VPC, Subnets, IGW
│       │   ├── Security/      # Grupos de seguridad y reglas de acceso
│       │   └── Database/      # Instancias de RDS y Subnet Groups
│       └── src/               # Configuraciones específicas por entorno
│           ├── 0-dev/         # Backend y variables para Desarrollo
│           ├── 1-test/        # Backend y variables para Test
│           └── 2-prod/        # Backend y variables para Producción
└── readme.md                  # Documentación general

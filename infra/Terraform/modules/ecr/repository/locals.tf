
locals {
  name = var.name != null ? "${var.name.namespace}/${var.name.microservice}" : "ecr-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
}
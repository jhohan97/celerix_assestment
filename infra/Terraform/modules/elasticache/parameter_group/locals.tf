
locals {
  name      = "elasticache-cluster-pg-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
  parameter = var.parameter_group_config.parameter != null ? { for idx, parameter in var.parameter_group_config.parameter : idx => parameter } : {}
}

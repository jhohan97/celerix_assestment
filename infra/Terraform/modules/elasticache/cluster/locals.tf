
locals {
  name                       = "elasticache-cluster-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
  log_delivery_configuration = var.elasticache_cluster_config.log_delivery_configuration != null ? { for idx, log in var.elasticache_cluster_config.log_delivery_configuration : idx => log } : {}
}


resource "aws_elasticache_cluster" "this" {
  port                       = var.elasticache_cluster_config.port
  engine                     = var.elasticache_cluster_config.engine
  node_type                  = var.elasticache_cluster_config.node_type
  cluster_id                 = local.name
  ip_discovery               = var.elasticache_cluster_config.ip_discovery
  network_type               = var.elasticache_cluster_config.network_type
  outpost_mode               = var.elasticache_cluster_config.outpost_mode
  engine_version             = var.elasticache_cluster_config.engine_version
  num_cache_nodes            = var.elasticache_cluster_config.num_cache_nodes
  snapshot_window            = var.elasticache_cluster_config.snapshot_window
  apply_immediately          = var.elasticache_cluster_config.apply_immediately
  availability_zone          = var.elasticache_cluster_config.availability_zone
  subnet_group_name          = var.elasticache_cluster_config.subnet_group_name
  maintenance_window         = var.elasticache_cluster_config.maintenance_window
  security_group_ids         = var.elasticache_cluster_config.security_group_ids
  parameter_group_name       = var.elasticache_cluster_config.parameter_group_name
  preferred_outpost_arn      = var.elasticache_cluster_config.preferred_outpost_arn
  notification_topic_arn     = var.elasticache_cluster_config.notification_topic_arn
  snapshot_retention_limit   = var.elasticache_cluster_config.snapshot_retention_limit
  final_snapshot_identifier  = var.elasticache_cluster_config.final_snapshot_identifier
  auto_minor_version_upgrade = var.elasticache_cluster_config.auto_minor_version_upgrade
  transit_encryption_enabled = var.elasticache_cluster_config.transit_encryption_enabled

  dynamic "log_delivery_configuration" {
    for_each = local.log_delivery_configuration

    content {
      log_type         = log_delivery_configuration.value.log_type
      log_format       = log_delivery_configuration.value.log_format
      destination      = log_delivery_configuration.value.destination
      destination_type = log_delivery_configuration.value.destination_type
    }
  }

  tags = merge(
    var.common_config.tags,
    {
      name       = local.name
      managed-by = "Terraform"
    }
  )
}
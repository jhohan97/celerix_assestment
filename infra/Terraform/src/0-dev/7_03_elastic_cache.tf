
module "elasticache_cluster" {
  source = "Configuration for the ElastiCache cluster"

    common_config = {
    name           = var.name
    tags           = var.tags
    environment    = var.environment
    resouce_number = 1    
  }

  elasticache_cluster_config = {
    port                       = 6379
    engine                     = "redis"
    node_type                  = "cache.t3.micro"
    num_cache_nodes            = 3
    availability_zone          = "us-east-1a"
    security_group_ids         = [module.sg.sg_id]
    parameter_group_name       = string
    auto_minor_version_upgrade = true
    transit_encryption_enabled = true

    log_delivery_configuration = {
      destination      = "cloudwatch-logs"
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "slow-log"
    }
  }
}

variable "common_config" {
  description = "Cluster commun config"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = string
  })

  validation {
    condition = alltrue([
      for tags in ["app-name"] : contains(keys(var.common_config.tags), tags)
    ])
    error_message = "The tags map must include the key-value pairs for: 'app-name'."
  }
}

variable "elasticache_cluster_config" {
  description = "Configuration for the ElastiCache cluster"

  type = object({
    port                       = optional(number)
    engine                     = string
    node_type                  = string
    ip_discovery               = optional(string)
    outpost_mode               = optional(string)
    network_type               = optional(string)
    engine_version             = optional(string)
    num_cache_nodes            = number
    snapshot_window            = optional(string)
    apply_immediately          = optional(bool)
    subnet_group_name          = optional(string)
    availability_zone          = optional(string)
    maintenance_window         = optional(string)
    security_group_ids         = optional(list(string))
    parameter_group_name       = string
    preferred_outpost_arn      = optional(string)
    notification_topic_arn     = optional(string)
    snapshot_retention_limit   = optional(number)
    final_snapshot_identifier  = optional(string)
    auto_minor_version_upgrade = optional(bool)
    transit_encryption_enabled = optional(bool)

    log_delivery_configuration = optional(list(object({
      destination      = string
      destination_type = string
      log_format       = string
      log_type         = string
    })))
  })
}


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

variable "subnet_group_config" {
  description = "Configuration for the ElastiCache cluster subnet group"

  type = object({
     subnet_ids  = list(string)
     description = string
  })
}

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

variable "parameter_group_config" {
  description = "Configuration for the ElastiCache cluster parameter group"

  type = object({
   family      = string
   description = string

    parameter = optional(list(object({
      name = string
      value = string
    })))
  })
}

variable "common_config" {
  description = "RDS commun config"

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

variable "instance_config" {
  description = "RDS SQL server configuraciones"

  type = object({
    engine                     = optional(string)
    multi_az                   = optional(bool)
    password                   = optional(string)
    username                   = optional(string)
    replicate                  = optional(string)
    subnet_ids                 = optional(list(string))
    storage_type               = optional(string)
    license_model              = optional(string)
    engine_version             = optional(string)
    instance_class             = string
    allocated_storage          = number
    apply_immediately          = bool
    storage_encrypted          = bool
    availability_zone          = optional(string)
    security_group_ids         = optional(list(string))
    character_set_name         = optional(string)
    deletion_protection        = bool
    skip_final_snapshot        = bool
    copy_tags_to_snapshot      = bool
    max_allocated_storage      = number
    backup_retention_period    = number
    auto_minor_version_upgrade = bool
    backup_window              = optional(string)
    maintenance_window         = optional(string)

    timeouts = object({
      create = string
      delete = string
      update = string
    })
  })
}

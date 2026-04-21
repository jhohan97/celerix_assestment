
variable "common_config" {
  description = "Cluster commun config"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = optional(string, 1)
  })

  validation {
    condition = alltrue([
      for tags in ["app-name"] : contains(keys(var.common_config.tags), tags)
    ])
    error_message = "The tags map must include the key-value pairs for: 'app-name'."
  }
}

variable "db_family" {
  description = "The db family"
  type        = string
}

variable "db_subnet_group" {
  description = "The subnet groups to the db"
  type        = list(string)
}

variable "cluster_config" {
  description = "Cluster config"

  type = object({
    port                         = number
    engine                       = string
    engine_mode                  = string
    engine_version               = string
    master_username              = string
    master_password              = string
    storage_encrypted            = bool
    availability_zones           = optional(list(string))
    skip_final_snapshot          = bool
    snapshot_identifier          = optional(string)
    vpc_security_group_ids       = list(string)
    preferred_backup_window      = optional(string)
    backup_retention_period      = number
    allow_major_version_upgrade  = optional(bool)
    preferred_maintenance_window = string
  })
}

variable "instance_config" {
  description = "Instance config"

  type = object({
    engine                       = string
    engine_version               = string
    instance_class               = string
    instance_number              = number
    publicly_accessible          = bool
    preferred_backup_window      = optional(string)
    preferred_maintenance_window = string
  })
}

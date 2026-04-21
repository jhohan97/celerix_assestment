
variable "common_config" {
  description = "ECR common config"

  type = object({
    name            = string
    environment     = string
    resource_number = string
  })

  default = null
}

variable "name" {
  description = "Policy to the ecr"

  type = object({
    namespace    = string
    microservice = string
  })

  default = null
}

variable "tags" {
  type        = map(string)
  description = "tags"

  validation {
    condition = alltrue([
      for tag in ["app-name"] : contains(keys(var.tags), tag)
    ])
    error_message = "The tags map must include the key-value pairs for: 'app-name'."
  }
}

variable "image_tag_mutability" {
  description = "Image tag mutability"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Scan on push"
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "Encryption type"
  type        = string
  default     = "KMS"
}

variable "kms_key" {
  description = "kms_key"
  type        = string
  default     = null
}
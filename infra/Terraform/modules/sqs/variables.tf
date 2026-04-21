
variable "common_config" {
  description = "SQS commun config"

  type = object({
    name            = optional(string)
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

variable "sqs_config" {
  description = "SQS configuration"

  type = object({
    name                              = optional(string)
    fifo_queue                        = bool
    delay_seconds                     = number
    max_message_size                  = number
    kms_master_key_id                 = optional(string)
    deduplication_scope               = optional(string)
    fifo_throughput_limit             = optional(string)
    sqs_managed_sse_enabled           = optional(bool)
    message_retention_seconds         = optional(number)
    receive_wait_time_seconds         = optional(number)
    serdelay_secondsvice_name         = optional(number)
    content_based_deduplication       = optional(bool)
    kms_data_key_reuse_period_seconds = optional(number)

    redrive_policy = optional(object({
      deadLetterTargetArn = string
      maxReceiveCount     = number
    }))

    redrive_allow_policy = optional(object({
      redrivePermission = string
      sourceQueueArns   = list(string)
    }))
  })
}

variable "queue_policy" {
  description = "queue policy Configuration"

  type    = string
  default = null
}


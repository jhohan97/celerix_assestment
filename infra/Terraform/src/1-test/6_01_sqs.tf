
module "sqs_config" {
  source = "../../modules/sqs"

  common_config = {
    name            = var.name
    tags            = var.tags
    resource_number = 1
    environment     = var.environment
  }

  sqs_config = {
    fifo_queue                        = true
    delay_seconds                     = 600
    max_message_size                  = 1024
    kms_master_key_id                 = module.kms.kms_key_id
  }
}


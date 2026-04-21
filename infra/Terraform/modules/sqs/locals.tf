
locals {
  name            = var.sqs_config.fifo_queue ? "${local.base_queue_name}.fifo" : local.base_queue_name
  base_queue_name = "sqs-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"

  redrive_policy = var.sqs_config.redrive_policy != null ? jsonencode({
    maxReceiveCount     = var.sqs_config.redrive_policy.maxReceiveCount
    deadLetterTargetArn = var.sqs_config.redrive_policy.deadLetterTargetArn   
  }) : null

  redrive_allow_policy = var.sqs_config.redrive_allow_policy != null ? jsonencode({
    sourceQueueArns   = var.sqs_config.redrive_allow_policy.sourceQueueArns
    redrivePermission = var.sqs_config.redrive_allow_policy.redrivePermission    
  }) : null
}
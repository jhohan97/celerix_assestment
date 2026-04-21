
resource "aws_sqs_queue" "this" {
  name                              = var.sqs_config.name != null ? var.sqs_config.name : local.name
  fifo_queue                        = var.sqs_config.fifo_queue
  delay_seconds                     = var.sqs_config.delay_seconds
  redrive_policy                    = local.redrive_policy
  max_message_size                  = var.sqs_config.max_message_size
  kms_master_key_id                 = var.sqs_config.kms_master_key_id
  deduplication_scope               = var.sqs_config.fifo_throughput_limit
  redrive_allow_policy              = local.redrive_allow_policy
  fifo_throughput_limit             = var.sqs_config.fifo_throughput_limit
  sqs_managed_sse_enabled           = var.sqs_config.sqs_managed_sse_enabled
  message_retention_seconds         = var.sqs_config.message_retention_seconds
  receive_wait_time_seconds         = var.sqs_config.receive_wait_time_seconds
  content_based_deduplication       = var.sqs_config.content_based_deduplication
  kms_data_key_reuse_period_seconds = var.sqs_config.kms_data_key_reuse_period_seconds

  tags = merge(
    var.common_config.tags,
    {
      name       = var.sqs_config.name != null ? var.sqs_config.name : local.base_queue_name
      managed-by = "Terraform"
    }
  )
}

resource "aws_sqs_queue_policy" "this" {
  count = var.queue_policy != null ? 1 : 0
  
  policy    = var.queue_policy
  queue_url = aws_sqs_queue.this.url
}

output "id" {
  description = "SQS id"
  value       = aws_sqs_queue.this.id
}

output "arn" {
  description = "SQS arn"
  value       = aws_sqs_queue.this.arn
}

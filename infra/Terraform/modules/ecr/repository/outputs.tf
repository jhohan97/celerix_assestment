
output "arn" {
  description = "ecr arn"
  value       = aws_ecr_repository.this.arn
}

output "id" {
  description = "ecr id"
  value       = aws_ecr_repository.this.registry_id
}

output "url" {
  description = "ecr url"
  value       = aws_ecr_repository.this.repository_url
}

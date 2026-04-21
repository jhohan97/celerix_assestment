
output "id" {
  description = "Policy id"
  value       = aws_ecr_repository_policy.this.registry_id
}

output "id" {
  description = "id"
  value = aws_elasticache_parameter_group.this.id
}

output "arn" {
  description = "arn"
  value = aws_elasticache_parameter_group.this.arn
}

output "name" {
  description = "name"
  value = aws_elasticache_parameter_group.this.name
}
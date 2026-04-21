
output "vpc_id" {
  description = "vpc id"
  value = aws_elasticache_subnet_group.this.vpc_id
}

output "name" {
  description = "name"
  value = aws_elasticache_subnet_group.this.name
}

output "id" {
  description = "The instance id"
  value = aws_db_instance.rds.id
}

output "arn" {
  description = "The instance arn"
  value = aws_db_instance.rds.arn
}


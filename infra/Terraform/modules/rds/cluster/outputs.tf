output "id" {
  description = "The ID of the RDS cluster"
  value       = aws_rds_cluster.this.id
}

output "arn" {
  description = "The ARN of the RDS cluster"
  value       = aws_rds_cluster.this.arn
}

output "cluster_endpoint" {
  description = "The endpoint of the RDS cluster"
  value       = aws_rds_cluster.this.endpoint
}




output "arn" {
  description = "arn"
  value       = aws_elasticache_cluster.this.arn
}

output "cache_nodes" {
  description = "cache nodes"
  value       = aws_elasticache_cluster.this.cache_nodes
}

output "cluster_address" {
  description = "cluster address"
  value       = aws_elasticache_cluster.this.cluster_address
}

output "engine_version_actual" {
  description = "engine version actual"
  value       = aws_elasticache_cluster.this.engine_version_actual
}

output "configuration_endpoint" {
  description = "configuration endpoint"
  value       = aws_elasticache_cluster.this.configuration_endpoint
}





resource "aws_elasticache_subnet_group" "this" {
  name        = local.name
  subnet_ids  = var.subnet_group_config.subnet_ids
  description = var.subnet_group_config.description

  tags = merge(
    var.common_config.tags,
    {
      name       = local.name
      managed-by = "Terraform"
    }
  )
}

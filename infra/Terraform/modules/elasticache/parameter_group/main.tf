
resource "aws_elasticache_parameter_group" "this" {
  name        = local.name
  family      = var.parameter_group_config.family
  description = var.parameter_group_config.description

  dynamic "parameter" {
    for_each = local.parameter

    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = merge(
    var.common_config.tags,
    {
      name       = local.name
      managed-by = "Terraform"
    }
  )
}

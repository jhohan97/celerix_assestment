
resource "aws_ecr_repository" "this" {
  name                 = local.name
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    kms_key         = var.kms_key
    encryption_type = var.encryption_type
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(
    var.tags,
    {
      name       = local.name
      managed-by = "Terraform"
    }
  )
}
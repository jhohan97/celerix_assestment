
resource "aws_ecr_repository_policy" "this" {
  repository = var.ecr_policy_config.name
  policy = var.ecr_policy_config.policy
}

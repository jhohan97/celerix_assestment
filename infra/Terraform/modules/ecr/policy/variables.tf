
variable "ecr_policy_config" {
  description = "ecr policy configuration"
  type = object({
    name   = string
    policy = string
  })
}

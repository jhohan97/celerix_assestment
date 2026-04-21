
### Example of how to call the module

```terraform

module "ecr" {
  source = ""
  common_config = {
    name        = var.name
    ecr         = 1
    environment = var.environment
    tags        = var.tags
  }
}

```

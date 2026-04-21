
module "security_group_LB" {
  source = "../modules/security_group"

  name   = var.name
  vpc_id = module.vpc_config.id

  rules = {
    ingress = {
      ddb = {
        cidr_blocks = ["10.0.0.0/16"]
        to_port     = 5432
        from_port   = 5432
        protocol    = "tcp"
        description = "Permite el ingreso unicamente desde la VPC a la que pertenece el SG"
      }
    }
    egress = {
      all = {
        cidr_blocks = [""] #Aca colocamos elbloque CIDR del ECS Tasks
        to_port     = 65535
        from_port   = 0
        protocol    = "tcp"
        description = "Permite el egreso a cualquier destino"
      }
    }
    tags = var.tags
  }
}

module "security_group_ECS" {
  source = "../modules/security_group"

  name   = var.name
  vpc_id = module.vpc_config.id

  rules = {
    ingress = {
      ddb = {
        cidr_blocks = ["10.0.0.0/16"]
        to_port     = 5432
        from_port   = 5432
        protocol    = "tcp"
        description = "Permite el ingreso unicamente desde la VPC a la que pertenece el SG"
      }
    }
    egress = {
      all = {
        cidr_blocks = [""] #Aca colocamos elbloque CIDR del ECS Tasks
        to_port     = 65535
        from_port   = 0
        protocol    = "tcp"
        description = "Permite el egreso a cualquier destino"
      }
    }
    tags = var.tags
  }
}

module "security_group_psql" {
  source = "../modules/security_group"

  name   = var.name
  vpc_id = module.vpc_config.id

  rules = {
    ingress = {
      ddb = {
        cidr_blocks = ["10.0.0.0/16"]
        to_port     = 5432
        from_port   = 5432
        protocol    = "tcp"
        description = "Permite el ingreso unicamente desde la VPC a la que pertenece el SG"
      }
    }
    tags = var.tags
  }
}

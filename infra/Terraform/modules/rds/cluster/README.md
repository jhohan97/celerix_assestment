

### Example of how to call the module

```terraform

module "rds_cluster" {
  source = ""

  common_config = {
    name        = var.name
    tags        = var.tags
    environment = var.environment
  }

  cluster_config = {
    engine                      = "aurora-postgresql"
    family                      = "aurora-postgresql15"
    db_port                     = 7437
    subnet_ids                  = module.vpc.private_subnets_ids
    cluster_engine              = "aurora-postgresql"
    instance_class              = "db.t4g.large"
    instance_count              = 1
    publicly_accessible         = false
    cluster_engine_version      = "15.3"
    cluster_security_groups     = [module.security_group_rds.group_id]
    cluster_postgres_username   = local.secret_values["username"]
    cluster_postgres_password   = sensitive(local.secret_values["password"])    
    cluster_skip_final_snapshot = true  
  }
}

```
module "rds_cluster" {
  source = "../../modules/rds/cluster"

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
    cluster_security_groups     = [module.security_group_psql.id]
    cluster_postgres_username   = local.secret_values["username"]
    cluster_postgres_password   = sensitive(local.secret_values["password"])    
    cluster_skip_final_snapshot = true  
  }

  db_family = "aurora-postgresql15"
  db_subnet_group = module.subnet_protected.ids

  instance_config = {
    engine                       = "aurora-postgresql"
    engine_version               = "15.3"
    instance_class               = "db.t4g.large"
    instance_number              = 1
    publicly_accessible          = false
    preferred_backup_window      = "07:00-09:00"
    preferred_maintenance_window = "Mon:09:00-Mon:10:00"
  }
}
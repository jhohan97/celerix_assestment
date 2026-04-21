
### Example of how to call the module

module "rds_instance" {
  source = ""

  common_config = {
    name           = var.name
    tags           = var.tags
    environment    = var.environment
    resouce_number = 1    
  }

  instance_config = {
    engine                     = "sqlserver-se"
    multi_az                   = false
    password                   = sensitive(local.secret_values["password"])
    username                   = local.secret_values["username"]
    subnet_ids                 = module.vpc.protected_subnets_ids
    storage_type               = "gp2"
    license_model              = "license-included"
    engine_version             = "15.00.4335.1.v1"
    instance_class             = "db.m5.large"     
    allocated_storage          = 50
    apply_immediately          = true
    storage_encrypted          = true  
    character_set_name         = "SQL_Latin1_General_CP1_CI_AS"    
    security_group_ids         = [module.security_group_rds.group_id]
    skip_final_snapshot        = true
    deletion_protection        = false
    copy_tags_to_snapshot      = true
    max_allocated_storage      = 100
    backup_retention_period    = 7    
    auto_minor_version_upgrade = true
    
    timeouts = {
      create = "2h"
      delete = "2h"
      update = "2h"
    }
  }
}

```


resource "aws_db_instance" "rds" {
  engine                     = var.instance_config.engine
  multi_az                   = var.instance_config.multi_az
  password                   = var.instance_config.password
  username                   = var.instance_config.username
  identifier                 = "rds-sql-server-${local.base_name}"
  storage_type               = var.instance_config.storage_type
  license_model              = var.instance_config.license_model
  engine_version             = var.instance_config.engine_version
  instance_class             = var.instance_config.instance_class
  apply_immediately          = var.instance_config.apply_immediately
  allocated_storage          = var.instance_config.allocated_storage
  availability_zone          = var.instance_config.availability_zone
  storage_encrypted          = var.instance_config.storage_encrypted
  character_set_name         = var.instance_config.character_set_name
  replicate_source_db        = var.instance_config.replicate
  skip_final_snapshot        = var.instance_config.skip_final_snapshot
  deletion_protection        = var.instance_config.deletion_protection
  db_subnet_group_name       = aws_db_subnet_group.db_subnet_group.id
  copy_tags_to_snapshot      = var.instance_config.copy_tags_to_snapshot
  max_allocated_storage      = var.instance_config.max_allocated_storage
  vpc_security_group_ids     = var.instance_config.security_group_ids
  backup_retention_period    = var.instance_config.backup_retention_period
  auto_minor_version_upgrade = var.instance_config.auto_minor_version_upgrade
  backup_window              = var.instance_config.backup_window
  maintenance_window         = var.instance_config.maintenance_window

  timeouts {
    create = var.instance_config.timeouts.create
    delete = var.instance_config.timeouts.delete
    update = var.instance_config.timeouts.update
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.common_config.tags,
    {
      Name = "rds-instance-${local.base_name}"
    },
  )
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-instance-subnet-group-${local.base_name}"
  subnet_ids = var.instance_config.subnet_ids

  tags = merge(
    var.common_config.tags,
    {
      Name = "rds-instance-subnet-group-${local.base_name}"
    }
  )
}

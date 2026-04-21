
resource "aws_rds_cluster" "this" {
  port                            = var.cluster_config.port
  engine                          = var.cluster_config.engine
  engine_mode                     = var.cluster_config.engine_mode
  engine_version                  = var.cluster_config.engine_version
  master_username                 = var.cluster_config.master_username
  master_password                 = var.cluster_config.master_password
  storage_encrypted               = var.cluster_config.storage_encrypted
  availability_zones              = var.cluster_config.availability_zones
  cluster_identifier              = "rds-cluster-${local.base_name}"
  skip_final_snapshot             = var.cluster_config.skip_final_snapshot
  snapshot_identifier             = var.cluster_config.snapshot_identifier
  db_subnet_group_name            = aws_db_subnet_group.this.name
  vpc_security_group_ids          = var.cluster_config.vpc_security_group_ids
  backup_retention_period         = var.cluster_config.backup_retention_period
  preferred_backup_window         = var.cluster_config.preferred_backup_window
  allow_major_version_upgrade     = var.cluster_config.allow_major_version_upgrade
  preferred_maintenance_window    = var.cluster_config.preferred_maintenance_window
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.name

  tags = merge(
    var.common_config.tags,
    {
      name       = "rds-cluster-${local.base_name}"
      managed-by = "Terraform"
    }
  )
}

resource "aws_rds_cluster_instance" "this" {
  count = var.instance_config.instance_number

  engine                       = var.instance_config.engine
  identifier                   = "rds-instance-${var.common_config.name}-${var.common_config.environment}-${format("%02d", count.index + 1)}"
  engine_version               = var.instance_config.engine_version
  instance_class               = var.instance_config.instance_class
  cluster_identifier           = aws_rds_cluster.this.cluster_identifier
  publicly_accessible          = var.instance_config.publicly_accessible
  preferred_backup_window      = var.instance_config.preferred_backup_window
  db_parameter_group_name      = aws_db_parameter_group.this.name
  preferred_maintenance_window = var.instance_config.preferred_maintenance_window

  tags = merge(
    var.common_config.tags,
    {
      name       = "rds-instance-${var.common_config.name}-${var.common_config.environment}-${format("%02d", count.index + 1)}"
      managed-by = "Terraform"
    }
  )
}

resource "aws_db_parameter_group" "this" {
  name   = "rds-instance-pg-${local.base_name}"
  family = var.db_family

  tags = merge(
    var.common_config.tags,
    {
      name       = "rds-instance-pg-${local.base_name}"
      managed-by = "Terraform"
    }
  )
}

resource "aws_rds_cluster_parameter_group" "this" {
  name   = "rds-cluster-pg-${local.base_name}"
  family = var.db_family

  tags = merge(
    var.common_config.tags,
    {
      name       = "rds-cluster-pg-${local.base_name}"
      managed-by = "Terraform"
    }
  )
}

resource "aws_db_subnet_group" "this" {
  name       = "rds-sn-${local.base_name}"
  subnet_ids = var.db_subnet_group

  tags = merge(
    var.common_config.tags,
    {
      name       = "rds-snet-g-${local.base_name}"
      managed-by = "Terraform"
    }
  )
}

resource "aws_db_parameter_group" "rds" {
  count  = var.use_aurora ? 0 : 1

  name   = "${var.name}-rds-params"
  family = var.parameter_family

  parameter {
    name  = "max_connections"
    value = "200"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "log_statement"
    value = "all"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "work_mem"
    value = "65536"
    apply_method = "pending-reboot"
  }

  tags = var.tags
}

resource "aws_db_instance" "this" {
  count = var.use_aurora ? 0 : 1

  identifier = var.name

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  multi_az       = var.multi_az

  allocated_storage = var.allocated_storage
  db_name           = var.db_name
  username          = var.username
  password          = var.password

  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name  = aws_db_parameter_group.rds[0].name

  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = true

  tags = var.tags
}

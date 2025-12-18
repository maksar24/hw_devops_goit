output "endpoint" {
  description = "Database endpoint"
  value = var.use_aurora ? aws_rds_cluster.this[0].endpoint : aws_db_instance.this[0].endpoint
}

output "port" {
  description = "Database port"
  value = var.use_aurora ? aws_rds_cluster.this[0].port : aws_db_instance.this[0].port
}

output "db_name" {
  description = "Database name"
  value = var.db_name
}

output "security_group_id" {
  description = "Security group ID for DB"
  value       = aws_security_group.rds.id
}

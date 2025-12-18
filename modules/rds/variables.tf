variable "name" {
  description = "Base name for RDS/Aurora resources"
  type        = string
}

variable "tags" {
  description = "Tags for all RDS resources"
  type        = map(string)
  default     = {}
}

variable "use_aurora" {
  description = "If true - create Aurora Cluster, else regular RDS instance"
  type        = bool
  default     = false
}
variable "vpc_id" {
  description = "VPC ID where DB will be deployed"
  type        = string
}

variable "subnet_public_ids" {
  description = "Public subnet IDs"
  type        = list(string)
  default     = []
}

variable "subnet_private_ids" {
  description = "Private subnet IDs"
  type        = list(string)
  default     = []
}

variable "publicly_accessible" {
  description = "Whether DB is publicly accessible"
  type        = bool
  default     = false
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for DB access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "engine" {
  description = "Database engine (postgres, mysql, aurora-postgresql, etc.)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "14.17"
}

variable "instance_class" {
  description = "Instance class for RDS or Aurora instances"
  type        = string
}

variable "multi_az" {
  description = "Enable Multi-AZ (only for RDS)"
  type        = bool
  default     = false
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "username" {
  description = "Master DB username"
  type        = string
}

variable "password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage in GB (RDS only)"
  type        = number
  default     = 20
}

variable "parameter_family" {
  description = "RDS parameter group family"
  type        = string
  default     = "postgres14"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "backend_bucket_name" {
  description = "S3 bucket name for terraform backend"
  type        = string
  default     = "your-unique-bucket-name" # <- заміни перед використанням
}

variable "backend_table_name" {
  description = "DynamoDB table name for terraform state locking"
  type        = string
  default     = "terraform-locks"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_name" {
  type    = string
  default = "lesson-5-vpc"
}

variable "ecr_name" {
  type    = string
  default = "lesson-5-ecr"
}

variable "ecr_scan_on_push" {
  type    = bool
  default = true
}
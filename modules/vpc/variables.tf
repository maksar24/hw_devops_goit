variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones where subnets will be created"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name tag for the VPC and its related resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region where all resources will be deployed"
  type        = string
}

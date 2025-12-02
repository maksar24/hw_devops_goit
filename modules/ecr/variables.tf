variable "ecr_name" {
  description = "ECR repository name"
  type        = string
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

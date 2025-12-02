resource "aws_dynamodb_table" "tf_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = var.table_name
    Environment = "lesson-5"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}
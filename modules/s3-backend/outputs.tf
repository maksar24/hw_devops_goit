output "bucket_id" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.tf_state.bucket
}

output "table_name" {
  description = "DynamoDB table name for locking"
  value       = aws_dynamodb_table.tf_locks.name
}
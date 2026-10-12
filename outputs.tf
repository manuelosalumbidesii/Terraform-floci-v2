output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.app_data.bucket
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.app_data.arn
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.users.name
}

output "sqs_queue_url" {
  description = "SQS queue URL"
  value       = aws_sqs_queue.tasks.url
}

output "iam_role_arn" {
  description = "IAM role ARN"
  value       = aws_iam_role.lambda_exec.arn
}

# ============================================================
# 1. S3 Bucket
# ============================================================
resource "aws_s3_bucket" "app_data" {
  bucket = "${var.project_name}-app-data-${var.environment}"

  tags = {
    Name        = "${var.project_name}-app-data"
    Environment = var.environment
  }
}

# ============================================================
# 2. DynamoDB Table
# ============================================================
resource "aws_dynamodb_table" "users" {
  name         = "${var.project_name}-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "user_id"

  attribute {
    name = "user_id"
    type = "S"
  }

  tags = {
    Name        = "${var.project_name}-users"
    Environment = var.environment
  }
}

# ============================================================
# 3. SQS Queue
# ============================================================
resource "aws_sqs_queue" "tasks" {
  name                       = "${var.project_name}-tasks"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 86400
  visibility_timeout_seconds = 30

  tags = {
    Name        = "${var.project_name}-tasks"
    Environment = var.environment
  }
}

# ============================================================
# 4. IAM Role
# ============================================================
resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-lambda-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })

  tags = {
    Name        = "${var.project_name}-lambda-exec"
    Environment = var.environment
  }
}

# ============================================================
# 5. EC2 Instance
# ⚠️ I-comment out kung may AMI error sa FloCI
# ============================================================
# resource "aws_instance" "server" {
#   ami           = "ami-12345678"
#   instance_type = "t2.micro"
#
#   tags = {
#     Name        = "${var.project_name}-server"
#     Environment = var.environment
#   }
# }

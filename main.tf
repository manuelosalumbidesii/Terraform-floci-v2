terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key                  = "test-1"
  secret_key                  = "test-1"
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    s3       = var.floci_endpoint
    sts      = var.floci_endpoint
    dynamodb = var.floci_endpoint
    sqs      = var.floci_endpoint
    iam      = var.floci_endpoint
    ec2      = var.floci_endpoint
    lambda   = var.floci_endpoint
  }
}

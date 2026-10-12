variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "floci_endpoint" {
  description = "FloCI endpoint URL"
  type        = string
  default     = "http://localhost:4566"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
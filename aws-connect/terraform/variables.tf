variable "region" {
  description = "AWS region for the Connect instance"
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev/test/prod)"
  default     = "dev"
}

variable "instance_alias" {
  description = "Amazon Connect instance alias"
  default     = "support-dev"
}

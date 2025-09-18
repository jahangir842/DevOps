provider "aws" {
  region = var.region
}

# -----------------------------
# Amazon Connect Instance
# -----------------------------
resource "aws_connect_instance" "this" {
  identity_management_type = "CONNECT_MANAGED" # Or SAML, EXISTING_DIRECTORY
  inbound_calls_enabled    = true
  outbound_calls_enabled   = true
  instance_alias           = var.instance_alias

  tags = {
    Environment = var.environment
    Owner       = "DevOps"
  }
}

# -----------------------------
# Basic Security Profile
# -----------------------------
resource "aws_connect_security_profile" "basic" {
  instance_id = aws_connect_instance.this.id
  name        = "BasicAgent"
  description = "Basic agent security profile"
}

# -----------------------------
# Default Queue
# -----------------------------
resource "aws_connect_queue" "default" {
  instance_id = aws_connect_instance.this.id
  name        = "Support-Queue"
}

# -----------------------------
# Routing Profile
# -----------------------------
resource "aws_connect_routing_profile" "default" {
  instance_id   = aws_connect_instance.this.id
  name          = "Default-Routing-Profile"
  description   = "Basic routing profile for agents"
  default_outbound_queue_id = aws_connect_queue.default.id

  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }
}

# -----------------------------
# Example User
# -----------------------------
resource "aws_connect_user" "agent1" {
  instance_id        = aws_connect_instance.this.id
  name               = "agent1"
  routing_profile_id = aws_connect_routing_profile.default.id
  security_profile_ids = [
    aws_connect_security_profile.basic.id
  ]
  password = random_password.agent1.result
}

resource "random_password" "agent1" {
  length  = 16
  special = true
}

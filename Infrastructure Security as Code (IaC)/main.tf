provider "aws" {
  region = "eu-north-1"
}

# Secure IAM Role
resource "aws_iam_role" "secure_role" {
  name = "secure_terraform_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

# Encrypted S3 Bucket for Secure Storage
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "sayedaslam"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Security Group: Allow Only SSH from Trusted IP
resource "aws_security_group" "secure_sg" {
  name        = "secure_sg"
  description = "Allow SSH only from trusted IP"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.120/32"]  # Replace with your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Enable AWS GuardDuty for Threat Detection
resource "aws_guardduty_detector" "secure_guardduty" {
  enable = true
}

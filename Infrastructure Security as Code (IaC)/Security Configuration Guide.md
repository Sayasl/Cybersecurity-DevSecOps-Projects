# Security Configuration Guide

This guide provides an overview of the security configurations implemented in the Terraform setup for provisioning secure infrastructure in AWS. The configuration ensures security at different layers, including IAM roles, data encryption, access controls, and threat detection.
1. IAM Role: Secure Access Management

    IAM Role Creation: An IAM role named secure_terraform_role is created, with a trust policy allowing the EC2 service to assume the role. This role will be used to interact with other AWS resources securely.
        Policy: The role is designed to follow the principle of least privilege, allowing only the necessary EC2 services to assume the role and perform actions. This reduces the attack surface by limiting access to trusted services only.

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

    Security Best Practice: Ensure that IAM roles are assigned only to the necessary services and users, minimizing the risk of privilege escalation or unauthorized access.

2. S3 Bucket Encryption: Securing Stored Data

    S3 Bucket: The bucket sayedaslam is created with server-side encryption enabled using the AES256 algorithm. This ensures that all objects stored in the bucket are encrypted at rest, providing data confidentiality.
        Encryption Configuration: Server-side encryption is applied by default to all objects in the bucket, protecting sensitive data from unauthorized access.

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

    Security Best Practice: Enable encryption for all S3 buckets to ensure that data is protected both at rest and in transit, as encryption reduces the risk of data breaches and unauthorized access.

3. Security Group Configuration: Restricting Access to Trusted IPs

    Security Group: A security group secure_sg is created to allow only SSH (port 22) access from a specific trusted IP address (192.168.1.120/32). This configuration ensures that only authorized users can SSH into the EC2 instances associated with this security group, thereby reducing exposure to unauthorized access.
        Ingress Rules: The security group only allows inbound SSH traffic from the specified IP address.
        Egress Rules: The security group allows all outbound traffic, but this can be customized to restrict outbound communication if needed.

    resource "aws_security_group" "secure_sg" {
      name        = "secure_sg"
      description = "Allow SSH only from trusted IP"
      
      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["192.168.1.120/32"]
      }

      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }

    Security Best Practice: Follow the principle of least privilege for security groups by limiting access to only those IPs and ports necessary for the operation of your application. Restrict SSH access to specific IP addresses to prevent unauthorized access.

4. AWS GuardDuty: Threat Detection

    GuardDuty: AWS GuardDuty is enabled for continuous monitoring of malicious activity and unauthorized behavior in the AWS environment. GuardDuty helps in identifying and mitigating potential threats, such as compromised EC2 instances, unauthorized access to S3 buckets, and other security risks.
        Service Activation: The GuardDuty detector is activated to begin monitoring the AWS environment.

    resource "aws_guardduty_detector" "secure_guardduty" {
      enable = true
    }

    Security Best Practice: Always enable GuardDuty or similar threat detection services to monitor for potential threats in your cloud environment. GuardDuty helps detect unusual patterns and potential security risks in real-time, enabling faster response to attacks.

5. Terraform Configuration Overview

The Terraform configuration provided ensures that the necessary resources are created with security best practices in mind. The following files are part of the configuration:

    main.tf: Contains the main configuration for provisioning the IAM role, S3 bucket, security group, and GuardDuty detector.
    outputs.tf: Contains output variables for important information such as bucket name, security group ID, etc.
    variables.tf: Defines the variables used in the configuration (if any).

6. Conclusion

This configuration ensures that AWS resources are provisioned with robust security measures in place. By using Terraform to automate the deployment of secure infrastructure, this setup adheres to best practices such as least privilege access, encryption at rest, and network access controls. Additionally, cloud-native security services like GuardDuty provide proactive threat detection, enhancing the overall security posture.

Ensure that all IAM roles, S3 buckets, and security groups are reviewed periodically to maintain a secure infrastructure.
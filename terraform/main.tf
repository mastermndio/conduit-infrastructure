terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "mastermnd-terraform-state"
    key    = "pipelines/states"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#Create ec2 instance
resource "aws_instance" "conduit_webserver" {
  ami           = var.instance_ami
  instance_type = var.instance_size
  key_name      = var.aws_key_pair

  tags = {
    Name        = var.instance_url,
    Environment = terraform.workspace
  }
}
#Create Route53 Record
resource "aws_route53_record" "conduit_dns" {
  zone_id = "Z05690023PTE6SH9KEXSI"
  name    = var.instance_url
  type    = "A"
  ttl     = "300"
  records = [aws_instance.conduit_webserver.public_ip]
}

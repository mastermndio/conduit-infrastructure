terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
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

# Create a VPC
#resource "aws_vpc" "example" {
#  cidr_block = "10.0.0.0/16"
#}

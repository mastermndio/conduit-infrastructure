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
resource "aws_instance" "mastermnd_stream_test" {
  count         = 2
  ami           = "ami-0d9d9d7c41e26df25"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# Create a VPC
#resource "aws_vpc" "example" {
#  cidr_block = "10.0.0.0/16"
#}

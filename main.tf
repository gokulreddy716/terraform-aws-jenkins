resource "aws_s3_bucket" "demo" {
  bucket_prefix = "gokul-jenkins-demo-"

  tags = {
    Name        = "Gokul Jenkins Demo"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_vpc" "vpc_main" {
  cidr_block = "18.0.0.0/16"

  tags = {
    Name = "terraform-vpc-2"
  }
}

resource "aws_vpc" "vpc1_main" {
  cidr_block = "19.0.0.0/16"

  tags = {
    Name = "terraform-vpc-2"
  }
}
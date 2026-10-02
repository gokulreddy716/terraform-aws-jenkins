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
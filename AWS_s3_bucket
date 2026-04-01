provider "aws" {
  region = "ap-south-1" # Mumbai
}

# 1. The S3 Bucket for State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "v-chougale-tf-state-2026" # Must be globally unique
  
  lifecycle {
    prevent_destroy = true # Safety first
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 2. The DynamoDB Table for Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

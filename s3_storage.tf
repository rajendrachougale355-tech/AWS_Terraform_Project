
resource "aws_s3_bucket" "app_logs" {
  bucket = "rajendra-app-logs-2026" # Change this to a unique name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.app_logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "log_lifecycle" {
  bucket = aws_s3_bucket.app_logs.id

  rule {
    id      = "archive-and-delete-logs"
    status  = "Enabled"

    # Move to Glacier (Cheap) after 30 days
    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    # Delete forever after 365 days
    expiration {
      days = 365
    }
  }
}

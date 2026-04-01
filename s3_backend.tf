
terraform {
  backend "s3" {
    bucket         = "v-chougale-tf-state-2026"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

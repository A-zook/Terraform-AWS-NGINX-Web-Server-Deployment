provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "my-tf-backend-joshua"  # your existing bucket
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"               # or your actual AWS region
    # dynamodb_table = "terraform-locks"         # optional but recommended
    encrypt        = true
  }
}

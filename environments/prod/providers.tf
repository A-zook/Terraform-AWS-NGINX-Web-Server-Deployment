provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "my-tf-backend-joshua"
    key     = "env/prod/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

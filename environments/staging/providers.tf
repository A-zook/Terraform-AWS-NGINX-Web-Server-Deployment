provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "my-tf-backend-joshua"
    key     = "env/staging/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

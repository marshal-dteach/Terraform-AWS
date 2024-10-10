# Specify the provider and access details

provider "aws" {
    region = var.aws_region
}


terraform {
  backend "s3" {
    #change the bucket name before running
    bucket = "xxxxxxxx-terraform-states"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    key = "fargate-app/terraform.tfstate"
  }
}
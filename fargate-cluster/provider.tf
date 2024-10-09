# Specify the provider and access details

provider "aws" {
    region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
}

terraform {
  backend "s3" {
    bucket = "${local.account_id}-terraform-states"
    region = "${var.region}"
    dynamodb_table = "terraform-lock"
    key = "fargate-app/terraform.tfstate"
  }
}
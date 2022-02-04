# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

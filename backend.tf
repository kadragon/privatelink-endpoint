# https://www.terraform.io/language/settings/backends/s3

terraform {
  backend "s3" {
    region = "ap-northeast-2"

    bucket = "privatelink-endpoint-kadragon-tfstate"
    key    = "terraform.tfstate"

    dynamodb_table = "terraform-statelock"

    encrypt = true
  }
}

## https://www.terraform.io/language/settings/backends

# S3 bucket for backend
resource "aws_s3_bucket" "terraform_tfstate" {
  bucket = "privatelink-endpoint-kadragon-tfstate"

  versioning {
    enabled = true
  }
}

# dynamodb for backend
resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "terraform-statelock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "my_bucket1" {
  bucket = "infrasity-s3-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

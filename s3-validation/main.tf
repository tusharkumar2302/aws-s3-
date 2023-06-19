variable "bucket_name" {
  type    = string
  default = "s3-infrasity-dev-shan"
  
  validation {
    condition     = can(regex("^s3-infrasity-dev-shan.*", var.bucket_name))
    error_message = "Invalid bucket name. Bucket name must start with 's3-infrasity-dev-shan'."
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

}

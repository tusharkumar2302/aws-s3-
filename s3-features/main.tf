# Single bucket
resource "aws_s3_bucket" "my_bucket1" {
  bucket = "infrasity-s3-bucket"
  region = "us-east-1"
  acl    = "private"

  versioning {
    enabled = true
  }
}

# Multiple buckets
resource "aws_s3_bucket" "my_buckets2" {
  count  = 3
  bucket = "infrasity-s3-${count.index}"
  acl    = "private"

  versioning {
    enabled = true
  }
}

# Using for_each loop
variable "bucket_names" {
  type    = set(string)
  default = ["infrasity1", "infrasity2"]
}

resource "aws_s3_bucket" "my_buckets3" {
  for_each = var.bucket_names
  bucket   = each.value
  acl      = "private"

  versioning {
    enabled = true
  }
}

# Another loop
resource "aws_s3_bucket" "my_buckets4" {
  for_each = toset(["infrasity1", "infrasity2", "infrasity3", "infrasity4", "infrasity5"])
  bucket   = each.key
  acl      = "private"

  versioning {
    enabled = true
  }
}

# Features
resource "aws_s3_bucket" "infrasity_bucket" {
  bucket = "infrasity123"

  # Enable versioning for the bucket
  versioning {
    enabled = true
  }

  # Configure CORS (Cross-Origin Resource Sharing)
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  # Configure server-side encryption using AES256
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable object locking with compliance mode and 30 days retention
  object_lock_configuration {
    object_lock_enabled = "Enabled"
    rule {
      default_retention {
        mode = "COMPLIANCE"
        days = 30
      }
    }
  }

  # Configure logging for the bucket
  logging {
    target_bucket = "infrasity123"
    target_prefix = "logs/"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.infrasity_bucket.id

  # Add a lifecycle rule to transition objects to the Glacier storage class after 30 days and expire them after 365 days
  rule {
    id     = "rule-1"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}

resource "aws_iam_role" "replication_role" {
  name               = "s3-replication-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "replication_policy" {
  name   = "s3-replication-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl"
      ],
      "Resource": [
        "arn:aws:s3:::infrasity123/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "replication_policy_attachment" {
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}

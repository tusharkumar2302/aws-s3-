resource "aws_s3_bucket" "infrasity_bucket" {
  # Tag: S3 Bucket Configuration
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
  # Tag: Bucket Lifecycle Configuration
  bucket = aws_s3_bucket.infrasity_bucket.id

  # Add a lifecycle rule to transition objects to the Glacier storage class after 30 days and expire them after 365 days
  rule {
    id      = "rule-1"
    status  = "Enabled"

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
  # Tag: IAM Role for Replication
  name = "s3-replication-role"

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
  # Tag: IAM Policy for Replication
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
  # Tag: Attach Replication Policy to Role
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}
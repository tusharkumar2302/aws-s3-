
  resource "aws_secretsmanager_secret" "example" {
    name          = var.name
    description   = "This is a secret"
  }

  resource "aws_secretsmanager_secret_version" "example789" {
    secret_id     = aws_secretsmanager_secret.example.id
    secret_string = "example-string-to-protect"
  }

  output "secret_value" {
    value = aws_secretsmanager_secret_version.example789.secret_string
     sensitive = true
  }


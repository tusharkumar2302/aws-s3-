# S3 Bucket Creation and Features

This repository demonstrates different methods of creating an Amazon S3 bucket using Terraform and showcases various features and configurations.

## Table of Contents

- [Single Bucket](#single-bucket)
- [Multiple Buckets](#multiple-buckets)
- [Using `for_each` Loop with a Variable](#using-for_each-loop-with-a-variable)
- [S3 Bucket Features and Configurations](#s3-bucket-features-and-configurations)

## Single Bucket

The code in this section creates a single S3 bucket using the `aws_s3_bucket` resource.

## Multiple Buckets

The code in this section demonstrates creating multiple S3 buckets using the `aws_s3_bucket` resource and the `count` parameter.

## Using `for_each` Loop with a Variable

The code in this section showcases creating S3 buckets using the `for_each` loop and a variable.

## S3 Bucket Features and Configurations

The remaining code focuses on creating an S3 bucket with various features and configurations. It covers the following aspects:

- Bucket name
- Versioning
- CORS (Cross-Origin Resource Sharing)
- Server-side encryption using AES256
- Object locking
- Logging
- Tags

Feel free to explore the code in this repository to understand the different approaches and configurations for creating S3 buckets using Terraform.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |



## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.replication_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.replication_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.infrasity_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.my_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.my_buckets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_names"></a> [bucket\_names](#input\_bucket\_names) | n/a | `set(string)` | <pre>[<br>  "infrasity1",<br>  "infrasity2"<br>]</pre> | no |



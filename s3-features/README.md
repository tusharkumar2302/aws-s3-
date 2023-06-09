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



## Usage
Follow the instructions below to use the provided Terraform code to create AWS S3 buckets.

1. Initialize the Terraform working directory:

```bash
  terraform init

```
2. Preview the changes that will be applied:

```bash
terraform plan
```
3. If the plan looks correct, apply the changes to create the S3 buckets:
```bash
terraform apply
```
Note: Review the plan output carefully before proceeding with terraform apply.

4. Confirm the changes by typing yes when prompted.

5. Wait for Terraform to create the S3 buckets. Once completed, you will see the output with the bucket details.

## Examples
The main.tf file provides the following examples:

1. Single bucket: Creates a single S3 bucket with private ACL and versioning enabled.

2. Multiple buckets: Creates three S3 buckets with unique names using the count parameter.

3. Using for_each loop with a variable: Creates S3 buckets based on the names provided in the bucket_names variable.

4. Using for_each loop with a hardcoded list: Creates S3 buckets based on a hardcoded list of bucket names.

Feel free to uncomment the desired example and comment out others in the main.tf file.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or a pull request in this repository.


## Documentation

[Documentation](https://infrasityblog.hashnode.dev/title-four-ways-to-create-s3-buckets-using-terraform)


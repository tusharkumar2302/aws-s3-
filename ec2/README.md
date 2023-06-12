# EC2 Instance Terraform Configuration

This Terraform configuration creates an EC2 instance in AWS using the `aws_instance` resource.

## Prerequisites

Before using this Terraform configuration, ensure you have the following prerequisites:

- AWS account credentials (access key and secret key) with appropriate permissions to create EC2 instances.
- Terraform installed on your local machine.

## Usage

Follow the steps below to use this Terraform configuration:

1. Clone the repository or copy the relevant files (`main.tf` and `provider.tf`) to your local directory.

2. Open `provider.tf` file and update the following variables:
   - `access_key`: Enter your AWS access key.
   - `secret_key`: Enter your AWS secret key.

3. Customize the EC2 instance configuration in `main.tf` as per your requirements. The current configuration creates an EC2 instance with the following settings:
   - AMI: `ami-04e914639d0cca79a` (Amazon Linux 2)
   - Instance Type: `t3.micro`
   - Tags: Name = "infrasity-ec2-4"


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |



4. Initialize the Terraform working directory by running the following command:

"terraform init"


5. Preview the changes that Terraform will apply by running the following command:


"terraform plan"



6. If the plan looks correct, apply the changes and create the EC2 instance by running the following command:

"terraform apply"


Confirm the prompt by typing `yes`. Terraform will provision the EC2 instance according to the specified configuration.


## Cleanup

To destroy the EC2 instance and remove all associated resources, run the following command:

"terraform destroy"


Confirm the prompt by typing `yes`.


## Disclaimer

Please note that this Terraform configuration provisions resources in your AWS account, which may incur costs. Review the AWS pricing documentation for EC2 instances to understand the potential costs associated with running EC2 instances.

Ensure that you have reviewed and understood the code and its implications before executing it in your environment. Use at your own risk.

Feel free to update this README file with additional information specific to your project or configuration.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or a pull request in this repository.


## Documentation

[Documentation](https://hashnode.com/edit/clhktnlnk000009mrhacqfxbd)


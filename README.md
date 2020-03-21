# Documentation for using the Terraform code of this repository

This repository contains the Terraform codebase that can be used to:

1. Create IAM users and their corresponding credentials on multiple environments running one single
   ```terraform apply``` command
2. Output the username, access key and secret access key of each user in one line (comma separated)

## Requirements

You will need to have the following tools installed on your machine:

1. Terraform ```v0.12.2```
2. AWS cli tool ```v1.18.25```
3. An IAM user that has the privileges to create new users and their credentials. This would be the user that you are going to use to run your Terraform code.

## How to run the Terraform code

The structure of this codebase is shown below:

```
.
├── main.tf
├── outputs.tf
├── README.md
├── terraform.tfvars
└── variables.tf
```

Before running the ```terraform apply``` command, you would need to intitialize Terraform and also check the format of the files and also validate them:

``` 
terraform init
terraform fmt
terraform validate
```

After that you can simply run:

```terraform apply -var 'aws_credentials=<path_to_your_credentials_file>' -var 'region=<region_you_want_to_use>'```

e.g

```terraform apply -var 'aws_credentials=/home/jim/.aws/credentials' -var 'region=eu-west-2'```

In order to destroy your resources you can run:

```terraform apply -var 'aws_credentials=<path_to_your_credentials_file>' -var 'region=<region_you_want_to_use>'```

e.g

```terraform destroy -var 'aws_credentials=/home/jim/.aws/credentials' -var 'region=eu-west-2'```

## Note

Your credentials file should have the following format:

``` 
[default]
aws_access_key_id = <your_key>
aws_secret_access_key = <your_secret>
```

## Suggestions

1. Encapsulate this code under a module in order to be more reusable
2. Assume a different IAM user depending on the environment, if each environment is under a separate AWS account
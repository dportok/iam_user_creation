# Define the provider
provider "aws" {
  version                 = "~> 2.54"
  region                  = var.region
  shared_credentials_file = var.aws_credentials

}

# Create common tags for all resources
locals {
  common_tags = {
    Service   = "IAM User"
    Owner     = "Dimitrios Portokalidis"
    ManagedBy = "Terraform"
  }
}

# Get all combinations of usernames/environments
locals {
  users_envs = { for pair in setproduct(var.usernames, var.environments) : "${pair[0]}/${pair[1]}" => {
    username    = pair[0]
    environment = pair[1]
    }
  }
}

# Create the IAM users
resource "aws_iam_user" "user" {
  for_each = local.users_envs
  name     = join("-", [each.value.username, each.value.environment])

  tags = merge(local.common_tags, map("Environment", each.value.environment))
}

# Create Access keys and Secret Access keys for each IAM user
resource "aws_iam_access_key" "credentials" {
  for_each   = local.users_envs
  user       = join("-", [each.value.username, each.value.environment])
  depends_on = [aws_iam_user.user]
}

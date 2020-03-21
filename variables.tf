variable "usernames" {
  type    = list
  default = ["nevsa", "cordelia", "kriste", "darleen", "wynnie", "vonnie", "emelita", "maurita", "devinne", "breena"]

}

variable "environments" {
  type    = list
  default = ["dev", "qa", "uat", "test", "prod"]
}

variable "region" {
  description = "The region where the environment is being built"
}

variable "aws_credentials" {
  description = "The path to your AWS credentials"
}

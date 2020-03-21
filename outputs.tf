output "detailed_creds" {
  value = [for value in aws_iam_access_key.credentials : join(", ", concat(value[*].user, value[*].id, value[*].secret))]
}

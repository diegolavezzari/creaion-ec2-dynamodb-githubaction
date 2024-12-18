output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "dynamodb_table" {
  value = data.aws_dynamodb_table.terraform_state_lock.id
}

output "aws_s3_bucket" {
  value = data.aws_s3_bucket.terraform_state.id
}
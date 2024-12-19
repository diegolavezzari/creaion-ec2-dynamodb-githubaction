provider "aws" {
  region = var.region
}

data "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-backup-diego"
}

data "aws_dynamodb_table" "terraform_state_lock" {
  name = "terraform-state-lock"
}

resource "aws_instance" "app_server" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0167d706fb101e2ae"

  tags = {
    Name = "EC2-bucket-dynamodb"
  }

  # Script de userdata para instalar Apache
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

  depends_on = [data.aws_dynamodb_table.terraform_state_lock]
}

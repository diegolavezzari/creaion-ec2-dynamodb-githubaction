terraform {
  backend "s3" {
    bucket         = "terraform-backup-diego"
    region         = "us-east-1"
    key            = "backend.tfstate"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

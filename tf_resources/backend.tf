
terraform {
  backend "s3" {
    bucket = "rss-aws-devops"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}



# init

resource "aws_s3_bucket" "tf_states" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_states" {
  bucket = aws_s3_bucket.tf_states.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_states" {
  bucket                  = aws_s3_bucket.tf_states.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

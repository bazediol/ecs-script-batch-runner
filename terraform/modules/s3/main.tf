terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


resource "aws_s3_bucket" "script-runner-output" {
  bucket = "script-runner-output"

  tags = {
    app        = "script-runner"
  }
}

resource "aws_s3_bucket_public_access_block" "script-runner-output" {
  bucket = aws_s3_bucket.script-runner-output.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


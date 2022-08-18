terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "filling_status" {
  bucket = "amfilling"

    lifecycle {
        create_before_destroy = true
    }

    rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "gap_locks" {
  name             = "filling-up-locks"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  replica {
    region_name = "us-west-2"
  }
}
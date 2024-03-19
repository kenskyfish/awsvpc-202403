terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76"
    }
  }

  required_version = ">= 1.7" // Version of Terraform itself, not aws provider.
}

provider "aws" {
  region = var.aws_region
  profile = "frankfurt"
}

/*
Bad example - don't check secret key into code! Use local profile instead.
# provider "aws" {
#   region     = "us-west-2"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
# }
*/
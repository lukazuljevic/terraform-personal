terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "learning-tfstate-bucket"
    dynamodb_table = "learning-tfstate-lock"
    region         = "eu-central-1"
    encrypt        = true
    profile        = "lukaZuljevic"
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "lukaZuljevic"
}

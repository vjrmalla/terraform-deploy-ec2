provider "aws" {
  region  = "eu-west-2"
  profile = "terraform"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }

  }
}
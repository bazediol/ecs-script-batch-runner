terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  profile = "personal"
}

module "s3" {
    source = "./modules/s3"
}

module "ecs" {
    source = "./modules/ecs"
    iam_role_arn = module.iam.iam_role
}

module "iam" {
    source = "./modules/iam"
}
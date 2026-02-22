terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # or the exact version you want
    }
  }
}

provider "aws"{
region = "ap-south-1"
}

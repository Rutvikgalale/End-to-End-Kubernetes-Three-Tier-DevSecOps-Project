terraform {
  backend "s3" {
    bucket         = "my-bucket-96k"
    region         = "ap-south-1"
    key            = "End-to-End-Kubernetes-Three-Tier-DevSecOps-Project/Jenkins-Server-TF/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }

  required_version = ">=0.13.0"
}

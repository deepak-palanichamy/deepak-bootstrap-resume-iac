terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "breezeware-demo-terraform-state"
    key = "terraform.tfstate"
    profile = "breezeware-demo-AWSAdministratorAccess-736932228178"
  }
}
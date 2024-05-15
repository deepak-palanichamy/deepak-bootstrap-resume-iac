terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}


provider "aws" {
  region  = "us-east-1"
  profile = "breezeware-demo-AWSAdministratorAccess-736932228178"
  default_tags {
    tags = {
      Purpose = "demo"
      Owner   = "deepak"
      Account = "breezeware-demo"
    }
  }
  alias = "breezeware_demo"
}

provider "aws" {
  region  = "us-east-1"
  profile = "breezeware-marta-AdministratorAccess-637423244917"
  default_tags {
    tags = {
      Purpose = "demo"
      Owner   = "deepak"
      Account = "breezeware-marta"
    }
  }
  alias = "breezeware_marta"
}

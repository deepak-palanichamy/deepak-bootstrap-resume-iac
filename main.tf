provider "aws" {
  region  = "us-east-1"
  profile = "breezeware-demo-AWSAdministratorAccess-736932228178"
}

module "static_site" {
  source                           = "./modules/s3_site"
  sample_terraform_bucket_name_var = "2cca93cd-281e-4570-a9e3-20b4fe5e2a56"
}

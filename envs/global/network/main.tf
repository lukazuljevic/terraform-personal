locals {
  cidr_subnets = cidrsubnets("10.0.0.0/17", 4, 4, 4, 4)
}

module "vpc" {
  source = "../../../modules/vpc"

  name_prefix     = "learning-terraform"
  cidr            = "10.0.0.0/17"
  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets  = slice(local.cidr_subnets, 0, 2)
  private_subnets = slice(local.cidr_subnets, 2, 4)

  tags = {
    Environment = "global"
    Project     = "learning-terraform"
  }
}

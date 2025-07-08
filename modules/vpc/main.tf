module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name            = "${var.name_prefix}-vpc"
  cidr            = var.cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = merge(
    {
      Name        = "${var.name_prefix}-vpc"
      Environment = "global"
      Project     = "learning-terraform"
    },
    var.tags
  )
  public_subnet_tags = {
    Role = "public"
  }

  private_subnet_tags = {
    Role = "private"
  }
}



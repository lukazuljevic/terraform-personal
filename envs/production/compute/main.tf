module "web" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.public_subnets.ids
  security_groups = data.aws_security_groups.public_sg.ids
  name_prefix     = "learn-terraform-dev"
  assign_eip      = true

  tags = {
    Project     = "learning-terraform"
    Environment = "production"
    Role        = "web"
    ManagedBy   = "terraform"
  }
}

module "jumpbox" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.public_subnets.ids
  security_groups = data.aws_security_groups.jumpbox_sg.ids
  name_prefix     = "learn-terraform-jumpbox"
  assign_eip      = true

  tags = {
    Project     = "learning-terraform"
    Environment = "production"
    Role        = "jumpbox"
    ManagedBy   = "terraform"
  }
}

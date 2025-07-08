module "web" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.public_subnets.ids
  security_groups = data.aws_security_groups.public_sg.ids
  name_prefix     = "learn-terraform-dev"
  assign_eip      = true

  tags = {
    Project     = "learning-terraform"
    Environment = "dev"
    Role        = "web"
    ManagedBy   = "terraform"
  }
}

module "private_web" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.private_subnets.ids
  security_groups = data.aws_security_groups.private_sg.ids
  name_prefix     = "learn-terraform-dev-private"
  assign_eip      = false

  tags = {
    Project     = "learning-terraform"
    Environment = "dev"
    Role        = "web-private"
    ManagedBy   = "terraform"
  }
}


module "jumpbox" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.public_subnets.ids
  security_groups = data.aws_security_groups.jumpbox_sg.ids
  name_prefix     = "learn-terraform-dev-jumpbox"
  assign_eip      = true

  tags = {
    Project     = "learning-terraform"
    Environment = "dev"
    Role        = "jumpbox"
    ManagedBy   = "terraform"
  }
}

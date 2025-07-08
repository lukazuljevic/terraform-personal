module "web" {
  source = "../../../modules/ec2"

  instance_type   = "t2.micro"
  subnets         = data.aws_subnets.public_subnets.ids
  security_groups = data.aws_security_groups.public_sg.ids
  name_prefix     = "learn-terraform-dev"

  tags = {
    Project     = "learning-terraform"
    Environment = "dev"
    Role        = "web"
    ManagedBy   = "terraform"
  }
}

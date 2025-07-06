module "web" {
  source = "../../../modules/ec2"

  instance_type = "t2.micro"

  tags = {
    Project     = "learning-terraform"
    Environment = "dev"
    Role        = "web"
    ManagedBy   = "terraform"
  }
}

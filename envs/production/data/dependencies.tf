data "aws_security_groups" "private_sg" {
  tags = {
    Name    = "learning-terraform-vpc-private-sg"
    Project = "learning-terraform"
  }
}

data "aws_subnets" "private_subnets" {
  tags = {
    Name        = "learning-terraform-vpc"
    Environment = "global"
    Role        = "private"
  }
}

data "aws_subnets" "public_subnets" {
  tags = {
    Name        = "learning-terraform-vpc"
    Environment = "global"
    Project     = "learning-terraform"
    Role        = "public"
  }
}

data "aws_subnets" "private_subnets" {
  tags = {
    Name        = "learning-terraform-vpc"
    Environment = "global"
    Project     = "learning-terraform"
    Role        = "private"
  }
}

data "aws_security_groups" "public_sg" {
  tags = {
    Name    = "learning-terraform-vpc-public-sg"
    Project = "learning-terraform"
  }
}

data "aws_security_groups" "private_sg" {
  tags = {
    Name    = "learning-terraform-vpc-private-sg"
    Project = "learning-terraform"
  }
}

data "aws_security_groups" "jumpbox_sg" {
  tags = {
    Name    = "learning-terraform-vpc-jumpbox-sg"
    Project = "learning-terraform"
  }
}

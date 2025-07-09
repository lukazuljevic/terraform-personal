resource "aws_db_subnet_group" "main" {
  name       = "learn-terraform-db-subnet-group"
  subnet_ids = data.aws_subnets.private_subnets.ids

  tags = {
    Name    = "learn-terraform-db-subnet-group"
    Project = "learning-terraform"
  }
}

module "rds" {
  source = "../../../modules/rds"

  identifier           = "learn-terraform-db"
  instance_class       = "db.t3.micro"
  engine               = "postgres"
  engine_version       = "16.4"
  allocated_storage    = 20
  storage_type         = "gp2"
  db_name              = "learn_terraform_db"
  db_username          = var.db_username
  db_password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  security_groups      = data.aws_security_groups.private_sg.ids


  tags = {
    Project     = "learning-terraform"
    Environment = "production"
    Role        = "database"
    ManagedBy   = "terraform"
  }
}


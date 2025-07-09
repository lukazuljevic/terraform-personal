resource "aws_db_instance" "db" {
  identifier             = var.identifier
  instance_class         = var.instance_class
  engine                 = var.engine
  engine_version         = var.engine_version
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.security_groups
  skip_final_snapshot    = true

  tags = merge({
    Name = var.identifier
    }
    ,
    var.tags
  )
}

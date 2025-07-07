resource "aws_security_group" "public_sg" {
  name   = "${var.name_prefix}-vpc-public-sg"
  vpc_id = module.vpc.vpc_id

  tags = merge(
    {
      Name    = "${var.name_prefix}-vpc-public-sg"
      Project = "learning-terraform"
    }
  )
}

resource "aws_security_group_rule" "public_inbound_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}


resource "aws_security_group_rule" "public_inbound_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_inbound_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}


resource "aws_security_group" "private_sg" {
  name   = "${var.name_prefix}-vpc-private-sg"
  vpc_id = module.vpc.vpc_id

  tags = merge(
    {
      Name    = "${var.name_prefix}-vpc-private-sg"
      Project = "learning-terraform"
    }
  )
}

resource "aws_security_group_rule" "private_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_sg.id
}

resource "aws_security_group_rule" "private_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
  security_group_id = aws_security_group.private_sg.id
}

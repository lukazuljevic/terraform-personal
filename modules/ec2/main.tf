resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.name_prefix}-ssh-key"
  public_key = var.public_key
}

resource "random_shuffle" "subnets" {
  input        = var.subnets
  result_count = var.instance_count
}

resource "aws_instance" "ec2" {
  ami   = data.aws_ami.debian_ec2.id
  count = var.instance_count

  instance_type          = var.instance_type
  subnet_id              = random_shuffle.subnets.result[count.index]
  vpc_security_group_ids = var.security_groups
  key_name               = aws_key_pair.ec2_key.key_name


  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              echo '<h1>Hello, World!</h1>' > /var/www/html/index.nginx-debian.html
              systemctl enable nginx
              systemctl start nginx
            EOF
  lifecycle {
    # create_before_destroy = true
    ignore_changes = [ami]
  }

  root_block_device {
    volume_type = var.instance_storage_type
    volume_size = var.instance_storage_size
  }

  tags = merge(
    {
      Name = "learn-terraform-web-instance-${count.index + 1}"
    },
    var.tags
  )
}

resource "aws_eip" "web_eip" {
  count = var.instance_count

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = merge({
    Name = "web-eip-${count.index + 1}"
    },
  var.tags)
}

resource "aws_eip_association" "web_eip_association" {
  count = var.instance_count

  instance_id   = aws_instance.ec2[count.index].id
  allocation_id = aws_eip.web_eip[count.index].id
}

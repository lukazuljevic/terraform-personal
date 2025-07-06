resource "aws_instance" "ec2" {
  ami   = data.aws_ami.debian_ec2.id
  count = var.instance_count

  instance_type = var.instance_type

  lifecycle {
    # create_before_destroy = true
    ignore_changes = [ami, user_data, tags]
  }

  root_block_device {
    volume_type = var.instance_storage_type
    volume_size = var.instance_storage_size
  }

  tags = merge(
    {
      Name = "web-instance-${count.index + 1}"
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

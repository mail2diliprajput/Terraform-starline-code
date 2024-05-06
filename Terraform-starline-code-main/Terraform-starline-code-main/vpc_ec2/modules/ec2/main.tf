data "aws_ami" "ec2_instance_fillter" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "public_instance" {
  ami = data.aws_ami.ec2_instance_fillter.id
  vpc_security_group_ids = aws_security_group.web_server_sg.id
  instance_type = var.instance_type
  key_name = var.key_name
  count = var.create_public_instance ? 1 : 0

  tags = {
    Name = var.public_instance
  }
}

resource "aws_instance" "private_instance" {
  ami = data.aws_ami.ec2_instance_fillter.id
  vpc_security_group_ids = aws_security_group.web_server_sg.id
  instance_type = var.instance_type
  key_name = var.key_name
  count = var.create_private_instance ? 1 : 0
  
  tags = {
    Name = var.private_instance
  }
}


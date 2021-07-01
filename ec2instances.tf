locals {
  vpc_id       = aws_vpc.web_vpc.id
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "web_vpc" {
  id = local.vpc_id
}
resource "aws_instance" "web_public_instance" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.web_pulic_subnet.id
  vpc_security_group_ids = [aws_security_group.web_public_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "Web_Public_Instance ${count.index}"
  }
}
resource "aws_security_group" "web_public_sg" {
  name   = "${var.instance_name}_private_sg_public_sg"
  vpc_id = data.aws_vpc.web_vpc.id
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  egress {
    cidr_blocks = local.all_ips
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
  }
  tags = {
    "Name" = "web_public_sg"
  }
}
resource "aws_instance" "web_private_instance1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.web_private_subnet.id
  vpc_security_group_ids = [aws_security_group.web_private_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "Web_Private_Instance1"
  }
}
resource "aws_security_group" "web_private_sg" {
  name   = "${var.instance_name}_private_sg"
  vpc_id = data.aws_vpc.web_vpc.id
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = local.tcp_protocol
    cidr_blocks = [aws_vpc.web_vpc.cidr_block]
  }

  egress {
    cidr_blocks = local.all_ips
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
  }
  tags = {
    "Name" = "web_private_sg"
  }
}
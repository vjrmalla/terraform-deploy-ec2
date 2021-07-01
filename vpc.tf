resource "aws_vpc" "web_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Web-VPC"
  }
}
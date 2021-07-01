locals {
  pub_sub_cidr_block     = "10.0.1.0/24"
  private_sub_cidr_block = "10.0.2.0/24"
  availability_zone      = "eu-west-2a"
}
resource "aws_subnet" "web_pulic_subnet" {
  vpc_id                  = aws_vpc.web_vpc.id
  cidr_block              = local.pub_sub_cidr_block
  availability_zone       = local.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "web_pulic_subnet"
  }
}

resource "aws_subnet" "web_private_subnet" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = local.private_sub_cidr_block
  availability_zone = local.availability_zone
  tags = {
    Name = "web_private_subnet"
  }
}
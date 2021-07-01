resource "aws_route_table" "web_public_route" {
  vpc_id = aws_vpc.web_vpc.id
  route {
    cidr_block = var.all_cidr_block
    gateway_id = aws_internet_gateway.web_igw.id
  }
  tags = {
    Name = "web_public_rt"
  }
}
resource "aws_route_table" "web_private_route" {
  vpc_id = aws_vpc.web_vpc.id
  route {
    cidr_block = var.all_cidr_block
    gateway_id = aws_nat_gateway.web_ngw.id
  }
  tags = {
    Name = "web_private_rt"
  }
}
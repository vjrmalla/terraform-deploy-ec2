resource "aws_nat_gateway" "web_ngw" {
  allocation_id = aws_eip.web_eip.id
  subnet_id     = aws_subnet.web_pulic_subnet.id
  tags = {
    Name = "web_nat_gw"
  }

}
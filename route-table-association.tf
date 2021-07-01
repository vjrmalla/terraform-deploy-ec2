resource "aws_route_table_association" "web_rt_association_pub" {
  subnet_id      = aws_subnet.web_pulic_subnet.id
  route_table_id = aws_route_table.web_public_route.id
}

resource "aws_route_table_association" "web_rt_association_private" {
  subnet_id      = aws_subnet.web_private_subnet.id
  route_table_id = aws_route_table.web_private_route.id
}
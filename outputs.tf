output "vpc_id" {
  value = aws_vpc.web_vpc.id
}
output "public_instance1_IP" {
  value = aws_instance.web_public_instance[0].public_ip
}
output "public_instance2_IP" {
  value = aws_instance.web_public_instance[1].public_ip
}
output "private_instance_IP" {
  value = aws_instance.web_private_instance1.private_ip
}
output "subnet_id" {
    value = aws_subnet.subnet.id
}

output "subnet_cidr" {
    value = aws_subnet.subnet.cidr_block
  
}
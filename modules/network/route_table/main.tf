resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.rt_name
  }
}


resource "aws_route" "name" {
  for_each = { for idx, route in var.routes : idx => route }

  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = each.value.destination_cidr_block

  gateway_id     = lookup(each.value, "gateway_id", null)
  nat_gateway_id = lookup(each.value, "nat_gateway_id", null)
}
  

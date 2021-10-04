resource "aws_subnet" "public_subnet" {
  vpc_id = data.aws_vpc.server_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "us-west-2${var.availability_zone_marker}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_${var.availability_zone_marker}"
  }
}

/*resource "aws_route_table_association" "aws_route_table_association_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = data.aws_route_tables.rts.id
  #aws_route_table.public_route_table.id
}*/

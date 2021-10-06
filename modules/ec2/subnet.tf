resource "aws_subnet" "public_subnet" {
  vpc_id = data.aws_vpc.server_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "us-east-1${var.availability_zone_marker}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_${var.availability_zone_marker}"
  }
}


data "aws_vpc" "server_vpc" {
   filter {
    name   = "tag:Name"
    values = ["exp_vpc"]
  }
}

data "aws_route_tables" "rts" {
  vpc_id = data.aws_vpc.server_vpc.id

  filter {
    name   = "tag:Name"
    values = ["public_route_table"]
  }
}

data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.server_amis]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}



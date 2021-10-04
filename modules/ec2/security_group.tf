resource "aws_security_group" "sg_template" {
  name        = "${var.name}_security_group"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.exp_vpc.id
  #vpc_id = output.vpc_id.value
  #vpc_id = var.vpc_id
  vpc_id = data.aws_vpc.server_vpc.id

  ingress {
      description      = "TLS from VPC"
      from_port        = var.from_port
      to_port          = var.to_port
      protocol         = var.protocol
      cidr_blocks      = ["0.0.0.0/0"]
      }

    ingress {
      description      = "TLS from VPC"
      from_port        = var.from_port2
      to_port          = var.to_port2
      protocol         = var.protocol
      cidr_blocks      = ["0.0.0.0/0"]
      }
  

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  

  tags = {
    Name = "${var.name}_security_group"
  }
}
resource "aws_instance" "web" {
  #count = 3
  ami = data.aws_ami.server_ami.id
  #var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_template.id]
  subnet_id = aws_subnet.public_subnet.id
  user_data = var.user_data

  tags = {
    Name = "${var.name}_server"
    Role = var.role
    Environment = var.environment
  }
}
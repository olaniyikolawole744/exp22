variable "access_key" {
  type      = string
  default   = "${env("ACCESS_KEY")}"
  sensitive = true
}

variable "secret_key" {
  type      = string
  default   = "${env("SECRET_KEY")}"
  sensitive = true
}

variable "region" {
  type      = string
  default   = "us-west-2"
  sensitive = true
}

source "amazon-ebs" "tool_server_ami" {
  tags = {
    Name = "tool_server_ami"
  }
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  ssh_username  = "ec2-user"
  region        = "${var.region}"
  ami_name      = "tool_server_ami"
  source_ami    = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
}


build {
  sources = ["source.amazon-ebs.tool_server_ami"]

  provisioner "file" {
    source      = "public_key"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "secret_key"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "dependencies.sh"
  }

  provisioner "shell" {
    script = "openJDK11.sh"
  }

  provisioner "shell" {
    script = "tool_server_script.sh"
  }
}
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
  default   = "${env("REGION")}"
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
  source_ami    = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
}


build {
  sources = ["source.amazon-ebs.tool_server_ami"]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "tf-packer"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "get-pip.py"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "ansible_server_script.sh"
  }
}
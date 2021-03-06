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
  default   = "us-east-1"
  sensitive = true
}

source "amazon-ebs" "agents_server_ami" {
  tags = {
    Name = "agents_server_ami"
  }
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  region        = "${var.region}"
  ssh_username  = "ec2-user"
  ami_name      = "agents_server_ami"
  source_ami    = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
}

build {
  sources = ["source.amazon-ebs.agents_server_ami"]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "agent_ec2_user_ssh_key.sh"
  }

  provisioner "shell" {
    script = "agent_script.sh"
  }
}
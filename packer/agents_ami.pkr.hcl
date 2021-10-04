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

source "amazon-ebs" "agents_server_ami" {
  tags = {
    Name = "agents_server_ami"
  }
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  ssh_username  = "ec2-user"
  region        = "${var.region}"
  ami_name      = "agents_server_ami"
  source_ami    = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
}


build {
  sources = ["source.amazon-ebs.agents_server_ami"]

  provisioner "file" {
    source      = "public_key"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "agent_script.sh"
  }
}
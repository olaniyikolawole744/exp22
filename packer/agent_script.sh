#!/bin/bash
set -e

# Install necessary dependencies
sudo yum update -y
sudo yum install yum-utils -y
sudo yum install java -y
sudo amazon-linux-extras install epel -y


# Setup sudo to allow no-password sudo for "ansible" user
#sudo groupadd -r  sudo
#sudo useradd -m -s /bin/bash ansible
#sudo usermod -a -G sudo ansible
#sudo cp /etc/sudoers /etc/sudoers.orig
sudo useradd ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo su - ansible 
sudo mkdir .ssh
sudo chmod 700 .ssh
sudo cd .ssh
sudo touch authorized_keys
sudo chmod 600 authorized_keys
sudo cp /tmp/tf-packer.pub /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh


# Installing SSH key
#sudo mkdir  /home/ansible/.ssh
#sudo chmod 700 /home/ansible/.ssh
#sudo touch  /home/ansible/.ssh/authorized_keys
#sudo chmod 600 /home/ansible/.ssh/authorized_keys

#sudo usermod --shell /bin/bash ansible


 
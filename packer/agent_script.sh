#!/bin/bash
set -e

# Install necessary dependencies
sudo yum update -y
sudo yum install yum-utils -y
sudo yum install java -y
sudo amazon-linux-extras install epel -y


# Setup sudo to allow no-password sudo for "ansible" user
sudo groupadd -r  sudo
sudo useradd -m -s /bin/bash ansible
sudo usermod -a -G sudo ansible
sudo cp /etc/sudoers /etc/sudoers.orig
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible

# Installing SSH key
sudo mkdir  /home/ansible/.ssh
sudo chmod 700 /home/ansible/.ssh
sudo touch  /home/ansible/.ssh/authorized_keys
sudo cp /tmp/public_key /home/ansible/.ssh/authorized_keys
sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo usermod --shell /bin/bash ansible


 
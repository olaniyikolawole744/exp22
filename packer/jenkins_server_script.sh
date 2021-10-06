#!/bin/bash

#Creating Ansible User
sudo groupadd -r sudo
sudo useradd -m -s /bin/bash jenkins
sudo usermod -a -G sudo jenkins
sudo cp /etc/sudoers /etc/sudoers.orig
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# Installing SSH key
sudo mkdir  /home/jenkins/.ssh
sudo touch  /home/jenkins/.ssh/authorized_keys
sudo touch  /home/jenkins/.ssh/id_rsa
sudo touch  /home/jenkins/.ssh/id_rsa.pub
sudo chmod 700 /home/jenkins/.ssh
sudo cp /tmp/private_key /home/jenkins/.ssh/id_rsa
sudo chmod 600 /home/jenkins/.ssh/id_rsa
sudo cp /tmp/public_key /home/jenkins/.ssh/id_rsa.pub
sudo cp /tmp/public_key /home/jenkins/.ssh/authorized_keys
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh
sudo usermod --shell /bin/bash jenkins

#Installing Dependencies
sudo yum update -y
sudo yum install yum-utils -y
sudo yum update -y
sudo yum install git -y
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
sudo yum update -y
sudo yum install java -y
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install daemonize -y
sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
cd /home/ec2-user/.local/bin
pip install boto
/home/ec2-user/.local/bin/pip install boto
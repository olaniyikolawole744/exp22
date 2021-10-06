#!/bin/bash

#Creating Ansible User
sudo groupadd -r sudo
sudo useradd -m -s /bin/bash ansible
sudo usermod -a -G sudo ansible
sudo cp /etc/sudoers /etc/sudoers.orig
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible

# Installing SSH key
sudo mkdir  /home/ansible/.ssh
sudo touch  /home/ansible/.ssh/authorized_keys
sudo touch  /home/ansible/.ssh/id_rsa
sudo touch  /home/ansible/.ssh/id_rsa.pub
sudo chmod 700 /home/ansible/.ssh
sudo cp /tmp/private_key /home/ansible/.ssh/id_rsa
sudo chmod 600 /home/ansible/.ssh/id_rsa
sudo cp /tmp/public_key /home/ansible/.ssh/id_rsa.pub
sudo cp /tmp/public_key /home/ansible/.ssh/authorized_keys
sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo usermod --shell /bin/bash ansible

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


#curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py 
#pip3 install boto3
#pip show boto3
#sudo wget https://bootstrap.pypa.io.pip/2.7/get-pip.py

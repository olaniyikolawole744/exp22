#!/bin/bash
echo ----- updating sudo apt -----
#sudo apt list --upgradable
 #sudo yum update -y

# copying local machine pub key to authorized key of target machines
#echo ----- copy local pub key to host machine -----
#cat << EOF >> ~/home/ec2-user/.ssh/authorized_keys
#ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPU97b9uaJd7KZCdGrFIKeSnHh3cHKqOyST9Q/X4ZCEw 14809@LAPTOP-ND13IS36
#EOF

# Prepare Ansible dynamic inventory
echo ----- installing dependencies pip -----
#amazon-linux-extras install epel
# sudo apt install epel-release
# ansible-galaxy collection install amazon.aws
# apt-get wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
#sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
#python3 get-pip.py


# Install Boto
#echo ----- installing dependencies boto -----
#pip install boto
#/usr/bin/python3 -m pip install --upgrade pip

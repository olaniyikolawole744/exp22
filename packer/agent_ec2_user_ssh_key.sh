#!/bin/bash

# Installing SSH key
#sudo mkdir  /home/ec2-user/.ssh
#sudo chmod 700 /home/ec2-user/.ssh
#sudo touch  /home/ansible/.ssh/authorized_keys
sudo cp /tmp/tf-packer.pub /home/ec2-user/.ssh/authorized_keys
#sudo chmod 600 /home/ansible/.ssh/authorized_keys
#sudo chown -R ansible:ansible /home/ansible/.ssh
#sudo usermod --shell /bin/bash ansible
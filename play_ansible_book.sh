#!/bin/bash

# PLAY ANSIBLE PLAYBOOK 
cd ..
cd ansible-job
ls

export ANSIBLE_HOSTS=inventory/ec2.py
export EC2_INI_PATH=inventory/ec2.ini
cd inventory
ls 
sudo chmod 755 inventory/ec2.py
sudo chmod 755 inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/ec2.py

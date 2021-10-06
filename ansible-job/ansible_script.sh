#!/bin/bash

export ANSIBLE_HOSTS=/inventory/hosts/ec2.py
xport ANSIBLE_HOSTS=/inventory/hosts/ec2.ini
chmod 755 inventory/hosts/ec2.py
chmod 755 inventory/hosts/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/hosts/ec2.py --check
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/hosts/ec2.py 

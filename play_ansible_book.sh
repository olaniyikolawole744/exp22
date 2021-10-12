#!/bin/bash

# PLAY ANSIBLE PLAYBOOK 
cd ansible-job
ls
export ANSIBLE_HOSTS=inventory/hosts/ec2.py
export EC2_INI_PATH=inventory/hosts/ec2.ini
cd inventory/hosts
ls 
sudo chmod 755 ec2.py
sudo chmod 755 ec2.ini
cd ../../
ls
#sh "echo '${ANSIBLE_VAULT_PASSWORD_FILE}' > secret.txt"
#echo secret.txt
#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/hosts/ec2.py --vault-password-file secret.txt

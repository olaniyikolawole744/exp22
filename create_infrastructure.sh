#!/bin/bash

# CREATE VPC
cd vpc
ls
terraform init
terraform apply --auto-approve
#terraform destroy --auto-approve

# CREATE TOOL SERVER AMI
cd ..
cd packer
ls
packer fmt .
packer init tool_server_ami.pkr.hcl
packer init agents_ami.pkr.hcl
packer build tool_server_ami.pkr.hcl
packer build agents_ami.pkr.hcl

# CREATE SERVERS
cd ..
cd server
ls
terraform init
terraform apply '-var-file=infrastructure_values.tfvars' --auto-approve
#terraform destroy '-var-file=infrastructure_values.tfvars' --auto-approve

# ASSOCIATE SUBNETS TO ROUTE TABLE
cd ..
cd subnet_rt_assoc
ls
terraform init
terraform apply --auto-approve

# PLAY ANSIBLE PLAYBOOK 
cd ansible-job
ls
sudo chmod 755 inventory/ec2.py
sudo chmod 755 inventory/ec2.ini
cd ../
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/ec2.py
           


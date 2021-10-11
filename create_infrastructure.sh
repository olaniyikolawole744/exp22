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
/usr/bin/packer fmt tool_server_ami.pkr.hcl
/usr/bin/packer init tool_server_ami.pkr.hcl
/usr/bin/packer build tool_server_ami.pkr.hcl
/usr/bin/packer init agents_ami.pkr.hcl
/usr/bin/packer build agents_ami.pkr.hcl

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
cd ..
cd ansible-job
ls
export ANSIBLE_HOSTS=inventory/ec2.py
export EC2_INI_PATH=inventory/ec2.ini
sudo chmod 755 inventory/ec2.py
sudo chmod 755 inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/ec2.py

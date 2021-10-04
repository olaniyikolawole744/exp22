#!/bin/bash

# CREATE TOOL SERVER AMI
cd packer
packer fmt .
packer init tool_server_ami.pkr.hcl
packer init agents_ami.pkr.hcl
packer build tool_server_ami.pkr.hcl
packer build agents_ami.pkr.hcl

# CREATE VPC
cd ..
cd vpc
ls
terraform init
terraform apply --auto-approve
#terraform destroy --auto-approve

# CREATE SERVERS
cd ..
cd server
terraform init
terraform apply '-var-file=infrastructure_values.tfvars' --auto-approve
#terraform destroy '-var-file=infrastructure_values.tfvars' --auto-approve

# ASSOCIATE SUBNETS TO ROUTE TABLE
cd ..
cd subnet_rt_assoc
terraform init
terraform apply --auto-approve


# SSH INTO SERVER
#ssh -i ~/Downloads/train-oregon-kp.pem ec2-user@54.71.65.204
#pwd
#exit



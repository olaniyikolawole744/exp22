#!/bin/bash

###@@@DESTROY INFRASTRUCTURE@@@###

# DESTROY SERVERS
cd server
terraform destroy '-var-file=infrastructure_values.tfvars' --auto-approve

# DESTROY VPC
cd ..
cd vpc
ls
terraform destroy --auto-approve
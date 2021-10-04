# EC2 INSTANCE ARGUMENT VALUES
ami_values                         = ["tool_server_ami","agents_server_ami","agents_server_ami"]
#"ami-0c2d06d50ce30b442"
instance_type               = "t3.micro"
key_name                    = "train-oregon-kp"
user_data                   = ""
server_name                 = ["tool","broker","zookeeper"]
role                        = "app"
environment                 = "dev"
name                        = ""
name_list_index             = "1"
server_amis                 = ""

# SECURITY GROUP ARGUMENT VALUES
from_port = "22"
to_port   = "22"
from_port2 = ["22","9092","2021"]
to_port2 = ["22","9092","2021"]
protocol  = "tcp"

# SUBNET ARGUMENT VALUES
public_subnet_cidr_block = ["50.0.10.0/24","50.0.20.0/24","50.0.30.0/24"]
availability_zone_marker   = ["a","b","c"]

# BACKEND ARGUMENT VALUE
backend_key = ["kafka_project/tool/terraform.tfstate","kafka_project/broker/terraform.tfstate","kafka_project/zookeeper/terraform.tfstate"]

# AWS ARGUMENT VALUE
region = "us-west-2"
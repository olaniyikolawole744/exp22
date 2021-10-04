terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

/*module "vpc" {
    source = "../vpc"
    #subnet_id = module.servers.subnet_parameters.id
    #subnet_id = module.servers.subnet_parameters
}*/



module "servers" {
  count = 3
  source = "../modules/ec2"

  server_amis                        = var.ami_values[count.index]
  instance_type              = var.instance_type
  key_name                   = var.key_name
  user_data                  = var.user_data
  name                       = var.server_name[count.index]
  role                       = var.role
  environment                = var.environment
  from_port                  = var.from_port
  to_port                    = var.to_port
  from_port2                 = var.from_port2[count.index]
  to_port2                   = var.to_port2[count.index]
  protocol                   = var.protocol
  public_subnet_cidr_block   = var.public_subnet_cidr_block[count.index]
  availability_zone_marker   = var.availability_zone_marker[count.index]
  backend_key                = var.backend_key[count.index]
  name_list_index            = count.index
  #ami                        = var.ami[count.index]
}


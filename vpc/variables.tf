
 variable "vpc_region" {
     default = "us-east-1"
 }
variable "vpc_cidr_block" {
    default = "50.0.0.0/16"
}
variable "vpc_name" {
    default = "exp_vpc"
}

variable "backend_key" {
    default = "kafka_project/vpc/terraform.tfstate"
}


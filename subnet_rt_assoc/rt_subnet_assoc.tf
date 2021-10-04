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
  region  = var.vpc_region
}

resource "aws_route_table_association" "aws_route_table_association_public_subnet" {
  count = 3
  subnet_id =  data.aws_subnet.selected[count.index].id
  route_table_id = tolist(data.aws_route_tables.rts.ids)[0]
  }

output sub_id {
    
    value = data.aws_subnet.selected[0].id
}

output rtbl_id {
    value = tolist(data.aws_route_tables.rts.ids)[0]
    
}

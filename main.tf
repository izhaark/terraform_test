
# this is the network module to crete the basic VPC. 


module "network" {
  source = "./modules/network"
  #vpc
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc"

  public_subnets = {
    public_subnet_1 = {
      subnet_cidr = "10.0.1.0/24"
      route_table = "public_rt"
    }
  }

  private_subnets = {
    private_subnet_1 = {
      subnet_cidr = "10.0.2.0/24"
      route_table = "private_rt"
    }
  }

  route_tables = {
    public_rt = {
      routes = [{
        destination_cidr_block = "0.0.0.0/0"
        gateway_id             = "igw"
      }]
    },
    private_rt = {
      routes = [{
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id         = "natgw"
      }]
    }
  }
}




# # creating 2 key pairs 1 for bastion and 1 for private server
module "bastion_kp" {
  source = "./modules/security/keypair"
  key_pair_name = "bastion_kp"
}

module "pvt_ec2_kp" {
  source = "./modules/security/keypair"
  key_pair_name = "pvt_ec2_kp"
}


#### SECURITY GROUPS
module "bastion_sg" {
  source = "./modules/security/security_groups"

  sg_name = "bastion_sg"
  vpc_id  = module.network.vpc_id

  ingress_rules = [
    {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["${var.my_ip}/32"]
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]
}

module "private_sg" {
  source = "./modules/security/security_groups"

  sg_name = "pvt_ec2_sg"
  vpc_id  = module.network.vpc_id

  ingress_rules = [
    {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      security_groups = [module.bastion_sg.sg_id]
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]
}

module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion"
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = module.bastion_kp.key_pair_name
  monitoring    = true
  subnet_id     = module.network.public_subnet_ids["public_subnet_1"]
  vpc_security_group_ids = [module.bastion_sg.sg_id]
  associate_public_ip_address = true
  create_security_group = false

  tags = {
    Environment = "dev"
  }
}

module "private_ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "private-ec2"
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = module.pvt_ec2_kp.key_pair_name
  monitoring    = true
  subnet_id     = module.network.private_subnet_ids["private_subnet_1"]
  vpc_security_group_ids = [module.private_sg.sg_id]
  create_security_group = false

  tags = {
    Environment = "dev"
  }
}

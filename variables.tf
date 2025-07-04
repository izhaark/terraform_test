# # VPC
# variable "vpc_cidr" {
#   type        = string
#   description = "CIDR block for the VPC"
# }

# variable "vpc_name" {
#   type        = string
#   description = "Name for the VPC"
# }

# # Subnets
# variable "public_subnet_cidr" {
#   type        = string
#   description = "CIDR block for the public subnet"
# }

# variable "public_subnet_name" {
#   type        = string
#   description = "Name for the public subnet"
# }

# variable "private_subnet_cidr" {
#   type        = string
#   description = "CIDR block for the private subnet"
# }

# variable "private_subnet_name" {
#   type        = string
#   description = "Name for the private subnet"
# }

# #NAT
# variable "nat_name" {
#   type = string
#   description = "Name for the Nat Gateway"
  
# }

# # IGW
# variable "igw_name" {
#   type        = string
#   description = "Name for the Internet Gateway"
# }

# # Route Tables
# variable "public_rt_name" {
#   type        = string
#   description = "Name for the public route table"
# }

# variable "private_rt_name" {
#   type        = string
#   description = "Name for the private route table"
# }

# # Key pair generation

# variable "algorithm" {
#   type = string
#   description = "Algorithm used for key pair"
# }

# variable "rsa_bits" {
#   type = number
#   description = "Number of bits"
# }

# variable "key_pair_name1" {
#   type = string
#   description = "Name of the key  pair for Bastion"
# }

# variable "key_pair_name2" {
#   type = string
#   description = "Name of the key  pair for Ec2"
# }
# # Security Group

variable "my_ip" {
  type = string
  description = "IP adress for the terraform server "
  
}
# # reminder to create 2 security groups 1.bastion sg 2. private ec2 sg in tfvars

# #EC2
# variable "ami" {
#   type = string
#   description = "AMI for the EC2"
  
# }

# variable "instance_type" {
#   type = string
#   description = "Type of instance used"
  
# }


# variable "instance_name1" {
#   type = string
#   description = "Name of the Instance"
# }

# variable "instance_name2" {
#   type = string
#   description = "Name of the Instance"
# }
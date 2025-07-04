#### VPC ###

variable "vpc_cidr" {
  type = string

  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type = string
  description = "name of vpc"
}

# might need a vpc id variable

### SUBNET ###

variable "public_subnets" {
  type = map(object({
    subnet_cidr = string
    route_table = string
  }))

  description = "public subnet"
}


variable "private_subnets" {
  type = map(object({
    subnet_cidr = string
    route_table = string
  }))

  description = "private subnet"
}


# might need a private subnet id

### NAT ###

variable "nat_name" {
    type = string

    description = "Name for the NAT-GW"
    default = "natgw"
}

### IGW

variable "igw_name" {
  type = string
  description = "Internet Gateway Name"
  default = "igw"
}


### Route Table ###

variable "route_tables" {
  type = map(object({
    routes = list(any)
  }))
}
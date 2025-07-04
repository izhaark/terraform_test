variable "subnet_cidr" {
  type = string
  description = "This is the cidr of the subnet"
}

variable "subnet_name" {
  type = string
  description = "This is the name of the subnet"
  default = null
}

variable "vpc_id" {
  description = "VPC ID to associate the subnet with"
  type        = string
}
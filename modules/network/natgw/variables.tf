variable "public_subnet_id" {
  description = "The ID of the public subnet to attach NAT gateway to"
  type        = string
}

variable "name" {
  description = "Name tag for the NAT gateway"
  type        = string
  default = "natgw"
}

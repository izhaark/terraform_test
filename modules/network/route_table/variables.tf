variable "vpc_id" {
  type = string
  description = "This is the id of vpc to which the gateway is attached"
}
  
variable "routes" {
  type = list(object({
      destination_cidr_block = string
      nat_gateway_id = optional(string,null)
      gateway_id = optional(string, null)
    }))
}

variable "rt_name" {
  type = string
  description = "name of route table"
  default = null
}


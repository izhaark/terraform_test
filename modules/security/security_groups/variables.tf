variable "sg_name" {
  type        = string
  description = "Name of the Security Group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the SG will be created"
}

variable "ingress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string),null)
    security_groups  = optional(list(string), null)
  }))
  default = []
}

variable "egress_rules" {
  type = list(object({
    
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string), null)
    security_groups  = optional(list(string), null)
  }))
  default = []
}

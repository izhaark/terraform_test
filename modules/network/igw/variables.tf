variable "vpc_id" {
  type        = string
  description = "This is the id of vpc created"
}

variable "igw_name" {
  type        = string
  description = "This is the name for the internet gateway"
  default     = "igw"
}

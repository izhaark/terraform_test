variable "algorithm" {
  type        = string
  default     = "RSA"
  description = "Algorithm to use"
}

variable "rsa_bits" {
  type        = number
  default     = 4096
  description = "Give RSA lenght"
}

variable "ecdsa_curve" {
  type        = string
  default     = "P256"
  description = "Give the ECDSA curve"
}

variable "key_pair_name" {
    type = string
    description = " List of names of key-pair"
  
}
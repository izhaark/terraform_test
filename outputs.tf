# # Output VPC ID
# output "vpc_id" {
#   value       = module.network.vpc_id
#   description = "ID of the created VPC"
# }

# # Output Subnet IDs
# output "public_subnet_id" {
#   value       = module.network.public_subnet_id
#   description = "ID of the public subnet"
# }

# output "private_subnet_id" {
#   value       = module.network.private_subnet_id
#   description = "ID of the private subnet"
# }


output "bastion_ip" {
  value = module.bastion.public_ip
  description = "Public ipV4 address of bastion host"
  
}

output "pvt_key_bastion" {
  value = module.bastion_kp.private_key_pem
  sensitive = true
}

output "pvt_key_ec2" {
  value = module.pvt_ec2_kp.private_key_pem
  sensitive = true
}

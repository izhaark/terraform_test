output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = { for k, v in var.public_subnets : k => module.subnets[k].subnet_id }
}

output "private_subnet_ids" {
  value = { for k, v in var.private_subnets : k => module.subnets[k].subnet_id }
}

output "nat_gateway_id" {
  value = length(module.nat) > 0 ? module.nat[0].nat_gateway_id : null
}

output "igw_id" {
  value = length(module.igw) > 0 ? module.igw[0].igw_id : null
}
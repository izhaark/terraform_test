module "vpc" {
    source = "./vpc"

    vpc_cidr = var.vpc_cidr # create a var
    vpc_name = var.vpc_name # create a var
}

module "subnets" {
    source = "./subnet"
    for_each = merge(var.public_subnets, var.private_subnets)
    vpc_id = module.vpc.vpc_id
    subnet_cidr = each.value.subnet_cidr
    subnet_name = each.key
}



module "nat" {
    source = "./natgw"
    count = ((length(var.private_subnets) > 0 && length(var.public_subnets)> 0)) ? 1 : 0
    public_subnet_id = module.subnets[keys(var.public_subnets)[0]].subnet_id
    name = var.nat_name
}

module "igw" {
    source = "./igw"
    count = length(var.public_subnets) > 0 ? 1 : 0
    vpc_id = module.vpc.vpc_id
    igw_name = var.igw_name
}



locals {
  route_tables = {
    for rt_name, rt_data in var.route_tables : rt_name => {
      routes = [
        for route in rt_data.routes : merge(
          route,
          contains(keys(route), "nat_gateway_id") ? {
            nat_gateway_id = module.nat[0].nat_gateway_id
          } : {},
          contains(keys(route), "gateway_id") ? {
            gateway_id = module.igw[0].igw_id
          } : {}
        )
      ]
    }
  }
}



module "rt" {
    source = "./route_table"
    for_each = local.route_tables

    vpc_id = module.vpc.vpc_id
    routes = each.value.routes
    rt_name = each.key

}

module "rt_association" {
  source = "./route_table_association"
  for_each = merge(var.public_subnets, var.private_subnets)
  subnet_id = module.subnets[each.key].subnet_id
  route_table_id = module.rt[each.value.route_table].route_table_id
}
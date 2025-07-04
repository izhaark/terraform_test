# AWS Infrastructure with Bastion Host

This Terraform project creates a secure AWS infrastructure with a bastion host for accessing private EC2 instances.

## Architecture

The infrastructure includes:
- VPC with public and private subnets
- Internet Gateway and NAT Gateway
- Bastion host in public subnet
- Private EC2 instance in private subnet
- Security groups with proper access controls
- SSH key pairs for secure access

## Project Structure

```
.
├── main.tf                 # Main configuration
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── providers.tf            # Provider configuration
├── terraform.tfvars        # Variable values
└── modules/
    ├── network/            # Network module
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── variables.tf
    │   ├── vpc/            # VPC submodule
    │   ├── subnet/         # Subnet submodule
    │   ├── igw/            # Internet Gateway submodule
    │   ├── natgw/          # NAT Gateway submodule
    │   ├── route_table/    # Route Table submodule
    │   └── route_table_association/
    └── security/           # Security module
        ├── keypair/        # SSH Key Pair submodule
        └── security_groups/ # Security Groups submodule
```

## Usage

1. **Prerequisites**
   - AWS CLI configured
   - Terraform installed (>= 1.0)

2. **Deploy**
   ```bash
   terraform init
   terraform plan -var="my_ip=YOUR_IP_ADDRESS"
   terraform apply -var="my_ip=YOUR_IP_ADDRESS"
   ```

3. **Access**
   - Bastion host: Use generated private key from outputs
   - Private EC2: SSH through bastion host

## Requirements

| Name | Version |
|------|---------|
| aws | >=5.99.0 |
| tls | 4.0.4 |

## Modules

| Name | Source | Description |
|------|--------|-------------|
| network | ./modules/network | Creates VPC, subnets, gateways, and routing |
| bastion_kp | ./modules/security/keypair | SSH key pair for bastion host |
| pvt_ec2_kp | ./modules/security/keypair | SSH key pair for private EC2 |
| bastion_sg | ./modules/security/security_groups | Security group for bastion host |
| private_sg | ./modules/security/security_groups | Security group for private EC2 |
| bastion | terraform-aws-modules/ec2-instance/aws | Bastion host EC2 instance |
| private_ec2 | terraform-aws-modules/ec2-instance/aws | Private EC2 instance |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| my_ip | Your IP address for SSH access to bastion | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| bastion_ip | Public IP address of bastion host |
| pvt_key_bastion | Private key for bastion host (sensitive) |
| pvt_key_ec2 | Private key for private EC2 (sensitive) |
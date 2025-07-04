resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = var.key_pair_name # planning to pass a list of usern anes to create multiple key pair
  public_key = tls_private_key.key_pair.public_key_openssh
}

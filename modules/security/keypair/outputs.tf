output "private_key_pem" {
    value = tls_private_key.key_pair.private_key_pem
    sensitive = true
    description = "This is the private key for the key pair"
  
}

output "key_pair_name" {
    value = aws_key_pair.kp.key_name
  
}


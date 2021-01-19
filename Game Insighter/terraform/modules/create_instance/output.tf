output "gi_instance_public_ip" {
  value = aws_instance.gi_instance.public_ip
}

output "gi_instance_private_ip" {
  value = aws_instance.gi_instance.private_ip
}
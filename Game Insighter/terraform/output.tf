output "gi_instance_public_ip" {
  value = module.instances.gi_instance_public_ip
}

output "gi_instance_private_ip" {
  value = module.instances.gi_instance_private_ip
}

output "gi_rds_endpoint" {
  value = module.rds.gi_rds_endpoint
}

output "gi_rds_port" {
  value = module.rds.gi_rds_port
}
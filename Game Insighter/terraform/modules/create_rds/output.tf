output "gi_rds_endpoint" {
  value = aws_db_instance.gi_db_instance.endpoint
}

output "gi_rds_port" {
  value = aws_db_instance.gi_db_instance.port

}
provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred_file
}

data "aws_security_group" "gi_rds_sg" {
  name = var.rds_sec_grp
}
# Create db instance 1
resource "aws_db_instance" "gi_db_instance" {
  engine                 = var.rds_engine
  engine_version         = var.rds_eng_version
  identifier             = var.rds_identifier
  username               = var.rds_username
  password               = var.rds_password
  instance_class         = var.rds_instance_class
  allocated_storage      = var.rds_allocated_storage
  availability_zone      = var.rds_availability_zone
  db_subnet_group_name   = var.rds_subnet_group_name
  publicly_accessible    = var.rds_publicly_accessible
  vpc_security_group_ids = [data.aws_security_group.gi_rds_sg.id]
  name                   = var.rds_db_name
  skip_final_snapshot    = var.rds_skip_final_snapshot
  port                   = var.rds_port

}

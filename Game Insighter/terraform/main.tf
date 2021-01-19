module "instances" {
  source           = "./modules/create_instance"
  region           = var.aws_region
  cred_file        = var.aws_creds
  instance_ami     = "ami-0a91cd140a1fc148a"
  instance_type    = "t2.micro"
  ebs_device_name  = "/dev/sda1"
  ebs_vol_size     = 10
  instance_sec_grp = [""]
  ebs_vol_type     = "gp2"
  ec2_key_name     = ""
}
module "rds" {
  source                  = "./modules/create_rds"
  region                  = var.aws_region
  cred_file               = var.aws_creds
  rds_sec_grp             = ""
  rds_engine              = "mysql"
  rds_eng_version         = "8.0.20"
  rds_identifier          = ""
  rds_username            = ""
  rds_password            = ""
  rds_instance_class      = "db.t2.micro"
  rds_allocated_storage   = 20
  rds_availability_zone   = "us-east-2a"
  rds_subnet_group_name   = ""
  rds_publicly_accessible = true
  rds_db_name             = ""
  rds_skip_final_snapshot = true
  rds_port                = 3306
}


 

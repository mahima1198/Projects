variable "region" {
  default = "us-east-2"
}

variable "cred_file" {
  default = ""
}

variable "rds_sec_grp" {
  default = "default"
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_eng_version" {
  default = "8.0.20"
}
variable "rds_identifier" {
  default = ""
}
variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = ""
}

variable "rds_instance_class" {
  default = "db.t2.micro"
}

variable "rds_allocated_storage" {
  default = ""
}
variable "rds_availability_zone" {
  default = ""
}
variable "rds_subnet_group_name" {
  default = ""
}
variable "rds_publicly_accessible" {
  default = false
}

variable "rds_db_name" {
  default = ""
}
variable "rds_skip_final_snapshot" {
  default = true
}
variable "rds_port" {
  default = 3306
}


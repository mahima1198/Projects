variable "region" {
  default = "us-east-2"
}

variable "cred_file" {
  default = ""
}

variable "instance_ami" {
  default = "ami-0a91cd140a1fc148a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_sec_grp" {
  default = ["default"]
}

variable "ebs_device_name" {
  default = "/dev/sda1"
}

variable "ebs_vol_size" {
  default = 8
}

variable "ebs_vol_type" {
  default = "gp2"
}

variable "ec2_key_name" {
  default = ""
}
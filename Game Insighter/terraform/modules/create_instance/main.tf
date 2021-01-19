provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred_file
}

resource "aws_instance" "gi_instance" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  security_groups = var.instance_sec_grp
  key_name        = var.ec2_key_name

  tags = {
    project = "gameinsighter"
  }

  ebs_block_device {
    device_name           = var.ebs_device_name
    delete_on_termination = true
    volume_size           = var.ebs_vol_size
    volume_type           = var.ebs_vol_type
  }
}
/**
* First step is to select the provider
**/
provider "aws" {
  region = var.region
}

module "web-server" {
  //source        = "git@github.com:ravindrashimpi/tf-ec2-provision.git"
  source        = ".//modules/ec2"
  port_ssh      = var.port_ssh
  port_web      = var.port_web
  SSH_KEY_NAME  = var.SSH_KEY_NAME
  instance_type = var.instance_type
  ami_ubuntu    = var.ami_ubuntu
}

module "s3-bucket" {
  source      = ".//modules/s3"
  bucket_name = var.bucket_name
}




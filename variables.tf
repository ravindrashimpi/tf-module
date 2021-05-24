variable "region" {
  description = "Region for provisioning resource"
  type        = string
  default     = "ap-south-1"
}

variable "port_ssh" {
  description = "Port used for SSH"
  type        = number
  default     = 22
}

variable "port_web" {
  description = "Port used for Webserver"
  type        = number
  default     = 8080
}

variable "SSH_KEY_NAME" {
  description = "SSH Key name that will be used to connecting server"
  default     = "tf-tutorial"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance family"
  default     = "t2.micro"
  type        = string
}

variable "ami_ubuntu" {
  description = "AMI that will be used to provision the EC2 instance"
  default     = "ami-0c1a7f89451184c8b" //Ubuntu
  type        = string
}

variable "bucket_name" {
  description = "Bucket Name given to S3"
  type        = string
}
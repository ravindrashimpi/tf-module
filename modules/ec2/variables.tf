variable "port_ssh" {
  description = "Port used for SSH"
  type        = number
}

variable "port_web" {
  description = "Port used for Webserver"
  type        = number
}

variable "SSH_KEY_NAME" {
  description = "SSH Key name that will be used to connecting server"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance family"
  type        = string
}

variable "ami_ubuntu" {
  description = "AMI that will be used to provision the EC2 instance"
  type        = string
}
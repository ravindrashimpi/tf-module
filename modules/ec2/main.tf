/**
* Provision a new EC2 instance
**/
resource "aws_instance" "ec2-instance" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance-web.id, aws_security_group.instance-ssh.id]

  key_name = var.SSH_KEY_NAME

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}

/**
* Setup a security group to access webserver
*/
resource "aws_security_group" "instance-web" {
  name = "Terraform-EC2-Web"

  ingress {
    from_port   = var.port_web
    protocol    = "tcp"
    to_port     = var.port_web
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

/**
* Setup a security group to access server
*/
resource "aws_security_group" "instance-ssh" {
  name = "Terraform-EC2-SSH"

  ingress {
    from_port   = var.port_ssh
    protocol    = "tcp"
    to_port     = var.port_ssh
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


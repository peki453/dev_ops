terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = "us-east-2"
//  access_key = var.aws_access_key_id
//  secret_key = var.aws_secret_access_key
}


resource "aws_instance" "app_python" {
  ami           = var.ami
  availability_zone = "${var.region}${var.aws_region_az}"
  instance_type = var.instance
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = aws_key_pair.deployer.key_name


//  connection {
//    host = aws_instance.app_python.public_ip
//    type = "ssh"
//    private_key = file(var.private_key)
//    user = var.ansible_user
//    timeout = "2m"
//  }
//
//  provisioner "remote-exec" {
//    inline = ["sudo apt-get -qq install python -y"]
//
//  }
//
//  provisioner "local-exec" {
//    command = "ansible-playbook -u ${var.ansible_user} -i '${aws_instance.app_python.public_ip},' --private-key ${var.private_key} ../../ansible/playbooks/install_docker.yml"
//  }

  tags = {
    Name = "app_python"
  }
}
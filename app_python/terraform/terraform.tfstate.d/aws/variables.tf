variable "profile" {
  default = "terraform_iam_user"
}

variable "owner" {
  description = "Configuration owner"
  type        = string
}

variable "region" {
  default = "us-east-2"
}

variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}

variable "instance" {
  default = "t2.micro"
}

variable "instance_count" {
  default = "1"
}

variable "public_key" {
  default = "~/.ssh/terra.pub"
}

variable "private_key" {
  default = "~/.ssh/terra.pem"
}

variable "ansible_user" {
  default = "ubuntu"
}

variable "ami" {
  default = "ami-0700277a736498865"
}

# Variables for VPC
#################################

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

# Variables for Security Group
##################################

variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}

variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "22"
}

variable "sg_ingress_all_start" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "0"
}

variable "sg_ingress_all_end" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "65535"
}

variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}

variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}

variable "sg_egress_all_end" {
  description = "Port used for the egress rule"
  type        = string
  default     = "65535"
}

variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}

# Variables for Subnet
######################################

variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}

variable "sbn_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Variables for Route Table
######################################

variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "terra"
}
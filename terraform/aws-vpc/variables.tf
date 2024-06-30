variable "aws_profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-fareast-0"
}

variable "aws_keypair_name" {
  description = "AWS Key Pair name"
  type        = string
  default     = "aws-keypair-name"
}

variable "aws_dmz_az" {
  description = "DMZ Availability Zone"
  type        = string
  default     = "z"
}

variable "aws_used_azs" {
  description = "Availability zones to subnet (must have CIDR blocks defined for each)"
  type        = list(string)
  default     = ["x","y","z"]
}

variable "nat_ami" {
    description = "ami id for NAT instance (region specific)"
    type = string
    default = "ami-0a3d7c296abcde123"
}

variable "vpn_ami" {
    description = "ami id for VPN instance (region specific)"
    type = string
    default = "ami-0a3d7c296abcde123"
}

variable "test_ami" {
    description = "ami id for test instance (region specific)"
    type = string
    default = "ami-0a3d7c296abcde123"
}

variable "nat_instance_type" {
    description = "instance type for NAT instance"
    type = string
    default = "t3.micro"
}

variable "vpn_instance_type" {
    description = "instance type for VPN instance"
    type = string
    default = "t3.micro"
}

variable "test_instance_type" {
    description = "instance type for test instance"
    type = string
    default = "t3.micro"
}

variable "VPC_Name" {
    description = "Friendly VPC Name"
    type = string
    default = "My VPC"
}

variable "vpc-name" {
    description = "unfreindly-vpc-name"
    type = string
    default = "my-vpc"
}

variable "cidr-vpc" {
    description = "CIDR address space for whole vpc"
    type = string
    default = "10.10.0.0/16"
}

variable "cidr-dmz" {
    description = "CIDR address space for whole vpc"
    type = string
    default = "10.10.240.0/16"
}

variable "cidr-a" {
    description = "CIDR address space for DMZ"
    type = string
    default = "10.10.0.0/20"
}

variable "cidr-b" {
    description = "CIDR address space for DMZ"
    type = string
    default = "10.10.16.0/20"
}

variable "cidr-c" {
    description = "CIDR address space for DMZ"
    type = string
    default = "10.10.32.0/20"
}

variable "cidr-d" {
    description = "CIDR address space for DMZ"
    type = string
    default = "10.10.48.0/20"
}

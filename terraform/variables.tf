# Argument Reference for the resources
################################################################################

variable "region" {
  description = "Region be used for all the resources"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "final_project"
}

variable "terraform" {
  description = "Name to be used on all the resources as identifier"
  type        = bool
  default     = true
}


variable "owner" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "silo" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "ami_id" {
    description = "ami id to be used on all the ec2"
    type        = string
    default     = ""
}

variable "instance_type" {
    description = "instance type to be used on all the ec2"
    type        = string
    default     = ""   
}

variable "monitoring"{
    description = "value"
    type =bool
}

variable "associate_public_ip_address" {
    description ="ip address of the ec2"
    type        =  bool
}

variable "create_iam_instance_profile" {
    description ="iam role for the ec2 instance"
    type        =  bool
}

variable "ssm_policy" {
    description ="ssm policy for ec2"
    type        = string
    default     =""
}

variable "name" {
    description = "name of ec2"
    type = string
}


variable "cidr" {
    description = "cidr block"
    type        = string
}


variable "azs" {
    description = "availability zone where ec2 resides"
    type        = list(string)
}

variable "public_subnets" {
    description = "list of public subnets"
    type        = list(string)
}

variable "private_subnets" {
    description = "list of private subnet"
    type        = list(string)
}
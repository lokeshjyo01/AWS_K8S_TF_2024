### This is Variable which we have Defined ####################
variable "region" {
  default = "us-east-1"
}

 variable "access_key" {
  description = "access-key"
    type        = string
  default     = "accesskey"
}

variable "secret_key" {
  description = "secret-key"
    type        = string
  default     = "secretkey"
}
 


variable "ami_id" {
  default = "ami-053b0d53c279acc90"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "instance_type1" {
  default = "t2.micro"
}
variable "az_zone" {
  default = "us-east-1a"
}

variable "vpc_cidr" {
    default = "10.232.0.0/16"
  
}

variable "pub_subnet_cidr" {
  default = "10.232.2.0/24"
}

variable "priv_subnet_cidr" {
  default = "10.232.3.0/24"
}
variable "route" {
  default = "0.0.0.0/0"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

variable "elb_port" {
  description = "The port the NLB will use for HTTP requests"
  type = number
  default = 80
}



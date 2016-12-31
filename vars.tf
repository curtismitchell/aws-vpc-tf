variable "public_subnet_cidrs" { 
    type = "list"
    description = "list of subnet cidrs within the vpc for the public subnets\ne.g. [\"10.2.0.0/18\",\"10.2.64.0/18\"]"
    default = ["172.72.0.0/18","172.72.64.0/18"]
}

variable "private_subnet_cidrs" { 
    type = "list"
    description  = "list of subnet cidrs within the vpc for the private subnets\ne.g. [\"10.2.0.0/18\",\"10.2.64.0/18\"]"
    default = ["172.72.128.0/18", "172.72.192.0/18"]
}

variable "availability_zones" {
    type = "list"
    description = "list of availability zones to place subnets\ne.g. [\"us-east-1a\",\"us-east-1b\"]"
    default = ["us-east-1d","us-east-1e"]
 }

variable "cidr" {
    description = "cidr of the vpc\ne.g. \"10.2.0.0/16\""
    default = "172.72.0.0/16"
 }

variable "vpc_name" { 
    description = "name of the vpc"
}

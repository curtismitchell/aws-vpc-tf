variable "cidr" { }
variable "vpc_name" { }

/* VPC is a container for a software-defined network
    This resource will create a VPC and a main route table */
resource "aws_vpc" "vpc" {
    cidr_block = "${var.cidr}"
    enable_dns_hostnames = "true"

    tags {
        Name = "${var.vpc_name}"
    }
}

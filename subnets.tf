/* public subnets - traffic from the internet is routed to them.
    More than one for fault tolerance across multiple locations. */
resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${element(var.public_subnet_cidrs, count.index)}"
    count = "${length(compact(var.public_subnet_cidrs))}"

    map_public_ip_on_launch = true

    availability_zone = "${element(var.availability_zones, count.index)}"

    tags {
        Name = "public-${element(var.availability_zones, count.index)}"
    }
}

/* Internet Gateway allows public access. */
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.vpc_name} Internet Gateway"
  }
}

/*  The default route table only allows traffic to flow within the vpc.
    This route table will allow traffic to flow into the vpc from the internet gateway. */
resource "aws_route_table" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "${var.vpc_name} Public Route"
  }
}

/*  Associate the public subnets with the internet-accessible route table */
resource "aws_route_table_association" "p" {
    subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
    route_table_id = "${aws_route_table.igw.id}"
    count = "${length(compact(var.public_subnet_cidrs))}"
}

// PRIVATE SUBNETS

/* private subnets - can route traffic throughout the vpc and out via a NAT.
    More than one for fault tolerance across multiple locations. */
resource "aws_subnet" "private" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${element(var.private_subnet_cidrs, count.index)}"
    count = "${length(compact(var.private_subnet_cidrs))}"

    map_public_ip_on_launch = false

    availability_zone = "${element(var.availability_zones, count.index)}"

    tags {
        Name = "private-${element(var.availability_zones, count.index)}"
    }
}

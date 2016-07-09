output "public_subnets" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnets" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "public_route_table" {
  value = "${aws_route_table.igw.id}"
}

output "vpc" {
  value = "${aws_vpc.vpc.id}"
}

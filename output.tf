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

output "vpc_route_table" {
  value = "${aws_vpc.vpc.main_route_table_id}"
}

output "efs_mount_cmd" {
  value = "sudo mount -t nfs4 -o vers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${aws_efs_file_system.fs.id}.efs.us-east-1.amazonaws.com:/ efs"
}

output "efs_security_group" {
  value = "${aws_security_group.persistable.id}"
}

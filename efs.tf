resource "aws_efs_mount_target" "fsm" {
  file_system_id = "${aws_efs_file_system.fs.id}"
  subnet_id = "${element(aws_subnet.private.*.id, count.index)}" //each private subnet should be in a different AZ to adhere to the 1 EFS per AZ limitation
  count = "${length(compact(var.private_subnet_cidrs))}"
  security_groups = ["${aws_security_group.persistable.id}"]
}

resource "aws_efs_file_system" "fs" {
  creation_token = "fs-storage"

  tags {
    Name = "${var.vpc_name}"
  }
}

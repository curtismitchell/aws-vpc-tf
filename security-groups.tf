resource "aws_security_group" "sshable" {
  name = "sshable"
  description = "Allow ssh connections"

  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "sshable"
  }
}

resource "aws_security_group" "persistable" {
  name = "persistable"
  description = "Allow connection to efs"

  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "persistable"
  }
}

resource "aws_security_group" "instance_group" {
  name        = "${var.SERVICE}-ec2"
  description = "Controls access to EC2 mainly via SSH to perform CRUD operations"
  vpc_id      = data.aws_vpc.network.id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["109.74.247.220/32"]
  security_group_id = aws_security_group.instance_group.id
  description       = "INGRESS - SSH access to the AWS instance for CRUD operations from certain IPs"
}

resource "aws_security_group_rule" "egress_ssh" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/32"]
  security_group_id = aws_security_group.instance_group.id
  description       = "EGRESS - SSH access to the AWS instance for CRUD operations from certain IPs"
}

resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = -1
  cidr_blocks       = ["109.74.247.220/32"]
  security_group_id = aws_security_group.instance_group.id
  description       = "INGRESS - SSH access to the AWS instance for CRUD operations from certain IPs"
}

resource "aws_security_group_rule" "egress_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/32"]
  security_group_id = aws_security_group.instance_group.id
  description       = "EGRESS - SSH access to the AWS instance for CRUD operations from certain IPs"
}
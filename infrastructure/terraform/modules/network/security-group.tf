resource "aws_security_group" "instance_group" {
  name        = "${var.SERVICE}-ec2"
  description = "Controls access to EC2 mainly via SSH to perform CRUD operations"
  vpc_id      = data.aws_vpc.network.id
}

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/32"]
  security_group_id = aws_security_group.instance_group.id
  description       = "INGRESS - SSH access to the AWS instance for CRUD operations from certain IPs"
}

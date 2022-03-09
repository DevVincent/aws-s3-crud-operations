locals {
  userdata = templatefile("user_data.sh", {
    ssm_cloudwatch_config = aws_ssm_parameter.cw_agent.name
  })
}

data "aws_ami" "amazon_linux_2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

 owners = ["amazon"]
}

resource "aws_instance" "bastion_host" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t3.micro"
  iam_instance_profile    = aws_iam_instance_profile.this.name
  vpc_security_group_ids = [var.SECURITY_GROUP_ID]
  user_data              = local.userdata
  key_name               = aws_key_pair.instance_key.id

  tags                   = merge({ Name: "${var.SERVICE}-s3-crud" }, var.TAGS)
}

resource "aws_key_pair" "instance_key" {
  key_name = "${var.SERVICE}-key"
  public_key = tls_private_key.instance_private_key.public_key_openssh
}

resource "tls_private_key" "instance_private_key" {
  algorithm   = "RSA"
}

resource "local_file" "pem_output" {
  content  = tls_private_key.instance_private_key.private_key_pem
  filename = "${path.cwd}/infrastructure/certificates/ec2.pem"
}

output pub_key_ssh {
  value = tls_private_key.instance_private_key.public_key_openssh
}
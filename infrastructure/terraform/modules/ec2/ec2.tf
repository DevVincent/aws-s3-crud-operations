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
  # vpc_security_group_ids = [var.SECURITY_GROUP_ID]
  user_data              = local.userdata

  tags                   = merge({ Name: "${var.SERVICE}-s3-crud" }, var.TAGS)
}
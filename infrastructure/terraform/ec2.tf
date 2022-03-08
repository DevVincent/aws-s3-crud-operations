data "aws_ami" "amazon-linux-2" {
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

locals {
  userdata = templatefile("user_data.sh", {
    ssm_cloudwatch_config = aws_ssm_parameter.cw_agent.name
  })
}

resource "aws_instance" "bastion_host" {
  ami                  = "${data.aws_ami.amazon-linux-2.id}"
  instance_type        = "t3.micro"
  subnet_id            = aws_subnet.private_subnet.id
  iam_instance_profile = aws_iam_instance_profile.this.name

  user_data            = local.userdata

  tags                 = local.common_tags
}
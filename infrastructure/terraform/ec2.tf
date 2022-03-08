# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners   = ["099720109477"] # Canonical

#   tags     = local.common_tags
# }

# resource "aws_instance" "bastion_host" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"

#   user_data     = <<-EOL
#   #!/bin/bash -xe

#   apt update
#   echo "installing stuff"
#   EOL

#   tags          = local.common_tags
# }
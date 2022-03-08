variable SERVICE {}
variable STAGE {}
variable REGION {}

variable CONFIG_FILE_LOCATION {}

variable USERNAME {
  type    = list(string)
  default = [
    "sam.madeley@pshealthgroup.com",
    "ryan.megarity@pshealthgroup.com",
    "oliver.kelly@pshealthgroup.com"
  ]
}

variable USER {
  type    = list(string)
  default = [
    "sam",
    "ryan",
    "oliver"
  ]
}

variable MAIN_VPC_CIDR {
  default = "10.0.0.0/24"
}

variable PUBLIC_SUBNET {
  default = "10.0.0.128/26"
}

variable PRIVATE_SUBNET {
  default = "10.0.0.192/26"
}

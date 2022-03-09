variable SERVICE {}
variable STAGE {}
variable REGION {}

variable VPC_ID {
  default = "vpc-9cec4ae5"
  type    = string
}

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
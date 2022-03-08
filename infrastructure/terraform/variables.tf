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

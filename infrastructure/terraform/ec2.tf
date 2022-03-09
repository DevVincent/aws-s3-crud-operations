module ec2 {
  source = "./modules/ec2"

  SERVICE = var.SERVICE
  USER    = var.USER
  USERNAME = var.USERNAME
  TAGS   = local.common_tags
  SECURITY_GROUP_ID = module.network.security_group_id
}
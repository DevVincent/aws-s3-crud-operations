module network {
  source = "./modules/network"
  SERVICE = var.SERVICE
  VPC_ID  = var.VPC_ID
  TAGS    = local.common_tags
}
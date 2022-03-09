module s3 {
  source = "./modules/s3"
  SERVICE = var.SERVICE
  TAGS    = local.common_tags
}
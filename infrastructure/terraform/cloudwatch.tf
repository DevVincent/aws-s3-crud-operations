module cloudwatch {
  source = "./modules/cloudwatch"

  SERVICE = var.SERVICE
  TAGS    = local.common_tags

  instance_id = module.ec2.instance_id
}
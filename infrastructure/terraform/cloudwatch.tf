module cloudwatch {
  source = "./modules/cloudwatch"

  SERVICE = var.SERVICE
  REGION  = var.REGION
  TAGS    = local.common_tags

  INSTANCE_ID = module.ec2.instance_id
  BUCKET_ID   = module.s3.bucket_id
}
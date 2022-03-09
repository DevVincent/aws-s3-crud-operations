module ec2 {
  source = "./modules/ec2"

  SERVICE = var.SERVICE
  USER    = var.USER
  USERNAME = var.USERNAME
  TAGS   = local.common_tags
  SECURITY_GROUP_ID = module.network.security_group_id
  EC2_DASHBOARD_ARN = module.cloudwatch.ec2_dashboard_arn
  S3_DASHBOARD_ARN = module.cloudwatch.s3_dashboard_arn
}
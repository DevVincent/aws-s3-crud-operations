resource "aws_s3_bucket" "health-data" {
  bucket_prefix = "${var.SERVICE}-data"

  tags          = local.common_tags
}

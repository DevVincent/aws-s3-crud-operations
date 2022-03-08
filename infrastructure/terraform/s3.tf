resource "aws_s3_bucket" "health-data" {
  bucket_prefix = "${var.SERVICE}-${var.REGION}-data"

  tags          = local.common_tags
}

resource "aws_s3_bucket" "health_data" {
  bucket_prefix = "${var.SERVICE}-data"

  tags          = var.TAGS
}

resource "aws_s3_bucket" "health_logging" {
  bucket_prefix = "${var.SERVICE}-logging"

  tags          = var.TAGS
}

resource "aws_s3_bucket_logging" "health_bucket_logging" {
  bucket        = aws_s3_bucket.health_data.id

  target_bucket = aws_s3_bucket.health_logging.id
  target_prefix = "log/"

  depends_on    = [
    aws_s3_bucket.health_data
  ]
}

resource "aws_s3_bucket_acl" "health_data_acl" {
  bucket = aws_s3_bucket.health_data.id
  acl    = "private"
}

resource "aws_s3_bucket_notification" "sns_trigger" {
  bucket      = aws_s3_bucket.health_data.id

  topic {
    topic_arn = aws_sns_topic.s3_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }

  depends_on  = [
    aws_s3_bucket.health_data
  ]
}
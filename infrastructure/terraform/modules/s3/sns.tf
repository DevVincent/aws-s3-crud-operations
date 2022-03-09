locals {
  emails = [
    "vicentemanzano6@hotmail.es", 
    "sam.madeley@pshealthgroup.com",
    "ryan.megarity@pshealthgroup.com",
    "oliver.kelly@pshealthgroup.com"
  ]
}

resource "aws_sns_topic" "s3_topic" {
  name   = "s3-topic"
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": {
            "Service": "s3.amazonaws.com"
            },
        "Action": "SNS:Publish",
        "Resource": "*"
    }]
}
POLICY
  tags   = var.TAGS
}

resource "aws_sns_topic_subscription" "s3_topic_email_subscription" {
  count     = length(local.emails)
  topic_arn = aws_sns_topic.s3_topic.arn
  protocol  = "email"
  endpoint  = local.emails[count.index]
}

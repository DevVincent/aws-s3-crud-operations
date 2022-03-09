resource "aws_cloudwatch_dashboard" "health_data" {
  dashboard_name = "${var.SERVICE}-s3-data"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/Usage",
            "CallCount",
            "Type",
            "API",
            "Resource",
            "PutBucketNotification",
            "Service",
            "S3",
            "Class",
            "None"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "${var.REGION}",
        "title": "S3 Puts"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/S3",
            "NumberOfObjects",
            "BucketName",
            "${var.BUCKET_ID}"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "${var.REGION}",
        "title": "S3 Objects"
      }
    }
  ]
}
EOF
}
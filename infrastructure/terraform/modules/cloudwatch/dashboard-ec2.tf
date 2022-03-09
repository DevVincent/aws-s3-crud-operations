resource "aws_cloudwatch_dashboard" "health_crud" {
  dashboard_name = "${var.SERVICE}-ec2-crud"

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
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${var.INSTANCE_ID}"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "${var.REGION}",
        "title": "EC2 Instance CPU"
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
            "AWS/EC2",
            "NetworkIn",
            "InstanceId",
            "${var.INSTANCE_ID}"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "${var.REGION}",
        "title": "EC2 Instance Network"
      }
    }
  ]
}
EOF
}
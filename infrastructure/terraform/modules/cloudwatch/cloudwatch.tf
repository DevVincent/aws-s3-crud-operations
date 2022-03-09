//dashboards for s3

# resource "aws_cloudwatch_dashboard" "health_data_reads" {
#   dashboard_name = "${var.SERVICE}-s3-reads"

#   dashboard_body = <<EOF
# {
#   "widgets": [
#     {
#       "type": "metric",
#       "x": 0,
#       "y": 0,
#       "width": 12,
#       "height": 6,
#       "properties": {
#         "metrics": [
#           [
#             "AWS/S3",
#             "PutBucketNotification",
#             "InstanceId",
#             "i-012345"
#           ]
#         ],
#         "period": 300,
#         "stat": "Average",
#         "region": "us-east-1",
#         "title": "EC2 Instance CPU"
#       }
#     },
#     {
#       "type": "text",
#       "x": 0,
#       "y": 7,
#       "width": 3,
#       "height": 3,
#       "properties": {
#         "markdown": "Hello world"
#       }
#     }
#   ]
# }
# EOF
# }

# resource "aws_cloudwatch_dashboard" "health_data_writes" {
#   dashboard_name = "${var.SERVICE}-s3-writes"

#   dashboard_body = <<EOF
# {
#   "widgets": [
#     {
#       "type": "metric",
#       "x": 0,
#       "y": 0,
#       "width": 12,
#       "height": 6,
#       "properties": {
#         "metrics": [
#           [
#             "AWS/EC2",
#             "CPUUtilization",
#             "InstanceId",
#             "${var.instance_id}"
#           ]
#         ],
#         "period": 300,
#         "stat": "Average",
#         "region": "us-east-1",
#         "title": "EC2 Instance CPU"
#       }
#     },
#     {
#       "type": "text",
#       "x": 0,
#       "y": 7,
#       "width": 3,
#       "height": 3,
#       "properties": {
#         "markdown": "Hello world"
#       }
#     }
#   ]
# }
# EOF
# }

# //dashboars for ec2
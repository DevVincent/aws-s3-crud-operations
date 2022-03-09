output s3_dashboard_arn {
  value = aws_cloudwatch_dashboard.health_data.dashboard_arn
}

output ec2_dashboard_arn {
  value = aws_cloudwatch_dashboard.health_crud.dashboard_arn
}
resource "aws_iam_user" "iam_user" {
    count  = length(var.USERNAME)
    name   = element(var.USERNAME, count.index)
}

resource "aws_iam_user_policy_attachment" "ec2-user-full" {
  count      = length(var.USERNAME)
  user       = element(aws_iam_user.iam_user.*.name, count.index)
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_policy" "iam_policy" {
    name   = "ec2-cloudwatch-policy"
    policy = jsonencode(
        {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Action": [
                "ec2:Describe*"
            ],
            "Effect": "Allow",
            "Resource": "*"
            },
            {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:GetDashboard",
                "cloudwatch:ListDashboards",
                "cloudwatch:GetMetricData"
            ],
            "Resource": "*"
            },
            {
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel", 
                "ssm:GetConnectionStatus" 
            ],
            "Effect": "Allow",
            "Resource": "*"
            },

        ]
        }
    )
}

resource "aws_iam_user_login_profile" "iam_user_login_profile" {
    count   = length(var.USERNAME)
    user    = element(var.USERNAME, count.index)
    depends_on = [
      aws_iam_user.iam_user["*"]
    ]
}
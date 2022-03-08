resource "aws_ssm_parameter" "passwords" {
  count = length(var.USERNAME)
  name  = "${element(var.USERNAME, count.index)}-${var.SERVICE}"
  type  = "String"
  value = aws_iam_user_login_profile.iam_user_login_profile[count.index].password
}
resource "aws_ssm_parameter" "passwords" {
  count = length(var.USERNAME)
  name  = "${var.SERVICE}-${element(var.USERNAME, count.index)}-password"
  type  = "String"
  value = aws_iam_user_login_profile.iam_user_login_profile[count.index].password
}
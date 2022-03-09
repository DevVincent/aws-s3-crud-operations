resource "aws_ssm_parameter" "passwords" {
  count = length(var.USER)
  description = "A password"
  name  = "${var.SERVICE}-password-${element(var.USER, count.index)}"
  type  = "SecureString"
  value = aws_iam_user_login_profile.iam_user_login_profile[count.index].password
}

resource "aws_ssm_parameter" "cw_agent" {
  description = "Cloudwatch agent config to configure custom log"
  name        = "/cloudwatch-agent/config"
  type        = "String"
  value       = file("cw_agent_config.json")
}
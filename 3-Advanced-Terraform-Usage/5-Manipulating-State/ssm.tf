resource "aws_ssm_parameter" "myparameter-new" {
  name  = "/myapp/myparameter"
  type  = "String"
  value = "myvalue"
}

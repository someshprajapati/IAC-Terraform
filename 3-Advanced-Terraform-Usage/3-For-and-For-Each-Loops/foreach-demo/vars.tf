variable "AWS_REGION" {
  type    = string
  default = "ap-south-1"
}

variable "ports" {
  type = list(number)
  default = [22, 443, 80, 8080]
}

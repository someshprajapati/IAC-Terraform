variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa_personal"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa_personal.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    ap-south-1 = "ami-0c1a7f89451184c8b"
  }
}

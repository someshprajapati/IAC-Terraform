variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-0a7cf821b91bcccbc"
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa_personal"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa_personal.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

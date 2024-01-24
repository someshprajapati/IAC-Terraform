provider "aws" {
  access_key = "AKIA6ODU52UVICE4J5"
  secret_key = "z4w9wp4MT+JvEMFMSoDDoB"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"
}

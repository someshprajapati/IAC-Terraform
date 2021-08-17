provider "aws" {
  access_key = "AKIAUGYH525YZ3GRUUUUX"
  secret_key = "KLda2utRNKgq839zyupT+nEbUU8Qje"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
}


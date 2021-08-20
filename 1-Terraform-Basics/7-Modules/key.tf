resource "aws_key_pair" "mykey" {
  key_name   = "id_rsa_personal"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


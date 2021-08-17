variable "myvar" {
    type = string
    default = "Hello Terraform"
}

variable "mylist" {
    type = list
    default = [ "1", "2", "3" ]
}

variable "mymap" {
    type = map(string)
    default = {
        "mykey" = "my-value"
    }
}
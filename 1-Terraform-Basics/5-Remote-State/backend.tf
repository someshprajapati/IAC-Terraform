terraform {
    backend "s3" {
        bucket = "terraform-tfstate-somesh"
        key = "terraform/remote-state"
    }
}
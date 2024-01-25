## Modules in terraform 

1. To get the terraform consul module locally
    ```
    S😎MESH~[IAC-Terraform (main)]-$ cd 7-Modules/

    S😎MESH~[7-Modules (main)]-$ terraform get
    Downloading github.com/wardviaene/terraform-consul-module.git?ref=terraform-0.12 for consul...
    - consul in .terraform/modules/consul

    S😎MESH~[7-Modules (main)]-$ ls -l .terraform/modules/consul
    total 32
    -rw-r--r--  1 someshp  staff   176B Aug 20 19:18 README.md
    -rw-r--r--  1 someshp  staff   1.8K Aug 20 19:18 consul.tf
    -rw-r--r--  1 someshp  staff    73B Aug 20 19:18 outputs.tf
    drwxr-xr-x  3 someshp  staff    96B Aug 20 19:18 shared/
    -rw-r--r--  1 someshp  staff   2.9K Aug 20 19:18 variables.tf

2. To initilize the terraform locally
    ```
    S😎MESH~[7-Modules (main)]-$ terraform init
    ```

3. To create the machine using terraform
    ```
    S😎MESH~[7-Modules (main)]-$ terraform plan

    S😎MESH~[7-Modules (main)]-$ terraform apply
    ```

4. To destroy the machine using terraform
    ```
    S😎MESH~[7-Modules (main)]-$ terraform destroy
    ```

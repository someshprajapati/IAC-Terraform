## Machine creation on AWS using terraform 

1. To initilize the terraform locally
    ```
    S😎MESH~[IAC-Terraform (main)]-$ cd 1-First-Steps/
    S😎MESH~[1-First-Steps (main)]-$ terraform init
    ```

2. To create the machine using terraform
    ```
    S😎MESH~[1-First-Steps (main)]-$ terraform apply

    Equivalent command:
    S😎MESH~[1-First-Steps (main)]-$ terraform plan -out out.terraform; terraform apply out.terraform; rm out.terraform
    ```

3. To destroy the machine using terraform
    ```
    S😎MESH~[1-First-Steps (main)]-$ terraform destroy
    ```

## Software provisioning in terraform 

Before run the below steps, please create the `terraform.tfvars` file inside the directory and add the below 2 variables to conect to AWS account.
```
AWS_ACCESS_KEY = "XYZ"
AWS_SECRET_KEY = "KLda2uXYX"
```

1. To initilize the terraform locally
    ```
    S😎MESH~[Terraform-2021 (main)]-$ cd 3-Software-Provisioning/
    S😎MESH~[3-Software-Provisioning (main)]-$ terraform init
    ```

2. To create the machine using terraform
    ```
    S😎MESH~[3-Software-Provisioning (main)]-$ terraform plan

    S😎MESH~[3-Software-Provisioning (main)]-$ terraform apply
    ```

3. To destroy the machine using terraform
    ```
    S😎MESH~[3-Software-Provisioning (main)]-$ terraform destroy
    ```

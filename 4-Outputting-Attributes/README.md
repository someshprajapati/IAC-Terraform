## Variables in terraform 

Before run the below steps, please create the `terraform.tfvars` file inside the directory and add the below 2 variables to conect to AWS account.
```
AWS_ACCESS_KEY = "XYZ"
AWS_SECRET_KEY = "KLda2uXYX"
```

1. To initilize the terraform locally
    ```
    S😎MESH~[Terraform-2021 (main)]-$ cd 4-Outputting-Attributes/
    S😎MESH~[4-Outputting-Attributes (main)]-$ terraform init
    ```

2. To create the machine using terraform
    ```
    S😎MESH~[4-Outputting-Attributes (main)]-$ terraform plan

    S😎MESH~[4-Outputting-Attributes (main)]-$ terraform apply
    ```

3. To destroy the machine using terraform
    ```
    S😎MESH~[4-Outputting-Attributes (main)]-$ terraform destroy
    ```

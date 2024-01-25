## Variables in terraform 

1. To initilize the terraform locally
    ```
    S😎MESH~[IAC-Terraform (main)]-$ cd 10-ELB-Autoscaling
    S😎MESH~[10-ELB-Autoscaling (main)]-$ terraform init
    ```

2. To create the ELB using terraform
    ```
    S😎MESH~[10-ELB-Autoscaling (main)]-$ terraform plan

    S😎MESH~[10-ELB-Autoscaling (main)]-$ terraform apply
    ```
    
3. To test the ELB
    ```
    S😎MESH[10-ELB-Autoscaling (main)]~$ curl my-elb-1068113312.ap-south-1.elb.amazonaws.com
    this is: 10.0.1.183
    S😎MESH[10-ELB-Autoscaling (main)]~$ curl my-elb-1068113312.ap-south-1.elb.amazonaws.com
    this is: 10.0.2.146

    S😎MESH[10-ELB-Autoscaling (main)]~$ host my-elb-1068113312.ap-south-1.elb.amazonaws.com
    my-elb-1068113312.ap-south-1.elb.amazonaws.com has address 3.108.179.131
    my-elb-1068113312.ap-south-1.elb.amazonaws.com has address 15.206.47.203
    ```

4. To destroy the ELB using terraform
    ```
    S😎MESH~[10-ELB-Autoscaling (main)]-$ terraform destroy
    ```

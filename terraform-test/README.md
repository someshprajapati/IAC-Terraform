## Basic variable define and access via the terrafrom console

```
S😎MESH~[terraform-test (main)]-$ terraform console
> var.myvar
"Hello Terraform"

> "${var.myvar}"
"Hello Terraform"

> var.mylist
tolist([
  "1",
  "2",
  "3",
])

> "${var.mylist}"
tolist([
  "1",
  "2",
  "3",
])

> var.mylist[0]
"1"

> element(var.mylist, 1)
"2"

> slice(var.mylist, 0, 2)
tolist([
  "1",
  "2",
])

> var.mymap
tomap({
  "mykey" = "my-value"
})

> var.mymap["mykey"]
"my-value"
```


## Variable define using resource and tfvars, and access via the terrafrom console

```
S😎MESH~[terraform-test (main)]-$ terraform console
╷
│ Error: Could not load plugin
│
│
│ Plugin reinitialization required. Please run "terraform init".
│


S😎MESH~[terraform-test (main)]-$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.54.0...
- Installed hashicorp/aws v3.54.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


S😎MESH~[terraform-test (main)]-$ terraform console
> var.AWS_REGION
"ap-south-1"
```

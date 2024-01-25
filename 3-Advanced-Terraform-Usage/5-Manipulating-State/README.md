## State Manipulation in Terraform

```
S😎MESH~[5-Manipulating-State (main)]-$ terraform init

S😎MESH~[5-Manipulating-State (main)]-$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ssm_parameter.myparameter will be created
  + resource "aws_ssm_parameter" "myparameter" {
      + arn       = (known after apply)
      + data_type = (known after apply)
      + id        = (known after apply)
      + key_id    = (known after apply)
      + name      = "/myapp/myparameter"
      + tier      = "Standard"
      + type      = "String"
      + value     = (sensitive value)
      + version   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ssm_parameter.myparameter: Creating...
aws_ssm_parameter.myparameter: Creation complete after 3s [id=/myapp/myparameter]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

#### Terraform State List
```
S😎MESH~[5-Manipulating-State (main)]-$ terraform state
Usage: terraform state <subcommand> [options] [args]

  This command has subcommands for advanced state management.

  These subcommands can be used to slice and dice the Terraform state.
  This is sometimes necessary in advanced cases. For your safety, all
  state management commands that modify the state create a timestamped
  backup of the state prior to making modifications.

  The structure and output of the commands is specifically tailored to work
  well with the common Unix utilities such as grep, awk, etc. We recommend
  using those tools to perform more advanced state tasks.

Subcommands:
    list    List resources in the state
    mv      Move an item in the state
    pull    Pull current state and output to stdout
    push    Update remote state from a local state file
    rm      Remove instances from the state
    show    Show a resource in the state
S😎MESH~[5-Manipulating-State (main)]-$
S😎MESH~[5-Manipulating-State (main)]-$ terraform state list
aws_ssm_parameter.myparameter
```

#### Terraform State Pull
```
S😎MESH~[5-Manipulating-State (main)]-$ terraform state pull
{
  "version": 4,
  "terraform_version": "0.12.29",
  "serial": 1,
  "lineage": "9e0a5897-b2e7-3149-88c9-16fd41768c89",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_ssm_parameter",
      "name": "myparameter",
      "provider": "provider.aws",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "allowed_pattern": "",
            "arn": "arn:aws:ssm:ap-south-1:289390057329:parameter/myapp/myparameter",
            "data_type": "text",
            "description": "",
            "id": "/myapp/myparameter",
            "key_id": "",
            "name": "/myapp/myparameter",
            "overwrite": null,
            "tags": null,
            "tier": "Standard",
            "type": "String",
            "value": "myvalue",
            "version": 1
          },
          "private": "bnVsbA=="
        }
      ]
    }
  ]
}
```

#### Terraform State Show
```
S😎MESH~[5-Manipulating-State (main)]-$ terraform state list
aws_ssm_parameter.myparameter

S😎MESH~[5-Manipulating-State (main)]-$ terraform state show aws_ssm_parameter.myparameter
# aws_ssm_parameter.myparameter:
resource "aws_ssm_parameter" "myparameter" {
    arn       = "arn:aws:ssm:ap-south-1:289390057329:parameter/myapp/myparameter"
    data_type = "text"
    id        = "/myapp/myparameter"
    name      = "/myapp/myparameter"
    tier      = "Standard"
    type      = "String"
    value     = (sensitive value)
    version   = 1
}
```

#### Terraform State Show
```
S😎MESH~[5-Manipulating-State (main)]-$ cat ssm.tf
───────┴─────────────────────────────────────
       │ File: ssm.tf
───────┴─────────────────────────────────────
   1   │ resource "aws_ssm_parameter" "myparameter" {
   2   │   name  = "/myapp/myparameter"
   3   │   type  = "String"
   4   │   value = "myvalue"
   5   │ }
───────┴─────────────────────────────────────

Change the parameter name in `ssm.tf` file:

S😎MESH~[5-Manipulating-State (main)]-$ vi ssm.tf

S😎MESH~[5-Manipulating-State (main)]-$ cat ssm.tf
───────┴─────────────────────────────────────
       │ File: ssm.tf
───────┴─────────────────────────────────────
   1   │ resource "aws_ssm_parameter" "myparameter-new" {
   2   │   name  = "/myapp/myparameter"
   3   │   type  = "String"
   4   │   value = "myvalue"
   5   │ }
───────┴─────────────────────────────────────

S😎MESH~[5-Manipulating-State (main)]-$ terraform state list
aws_ssm_parameter.myparameter

S😎MESH~[5-Manipulating-State (main)]-$ terraform state mv aws_ssm_parameter.myparameter aws_ssm_parameter.myparameter-new

Move "aws_ssm_parameter.myparameter" to "aws_ssm_parameter.myparameter-new"
Successfully moved 1 object(s).

S😎MESH~[5-Manipulating-State (main)]-$ terraform state list
aws_ssm_parameter.myparameter-new

S😎MESH~[5-Manipulating-State (main)]-$ terraform apply
aws_ssm_parameter.myparameter-new: Refreshing state... [id=/myapp/myparameter]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.


S😎MESH[5-Manipulating-State (main)]~$ terraform state rm aws_ssm_parameter.myparameter-new
Removed aws_ssm_parameter.myparameter-new
Successfully removed 1 resource instance(s).

S😎MESH[5-Manipulating-State (main)]~$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ssm_parameter.myparameter-new will be created
  + resource "aws_ssm_parameter" "myparameter-new" {
      + arn            = (known after apply)
      + data_type      = (known after apply)
      + id             = (known after apply)
      + insecure_value = (known after apply)
      + key_id         = (known after apply)
      + name           = "/myapp/myparameter"
      + tags_all       = (known after apply)
      + tier           = (known after apply)
      + type           = "String"
      + value          = (sensitive value)
      + version        = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ssm_parameter.myparameter-new: Creating...
╷
│ Error: creating SSM Parameter (/myapp/myparameter): ParameterAlreadyExists: The parameter already exists. To overwrite this value, set the overwrite option in the request to true.
│
│   with aws_ssm_parameter.myparameter-new,
│   on ssm.tf line 1, in resource "aws_ssm_parameter" "myparameter-new":
│    1: resource "aws_ssm_parameter" "myparameter-new" {


S😎MESH[5-Manipulating-State (main)]~$ terraform state list

S😎MESH[5-Manipulating-State (main)]~$ terraform import aws_ssm_parameter.myparameter-new /myapp/myparameter
aws_ssm_parameter.myparameter-new: Importing from ID "/myapp/myparameter"...
aws_ssm_parameter.myparameter-new: Import prepared!
  Prepared aws_ssm_parameter for import
aws_ssm_parameter.myparameter-new: Refreshing state... [id=/myapp/myparameter]
Import successful!
The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.


S😎MESH[5-Manipulating-State (main)]~$ terraform state list
aws_ssm_parameter.myparameter-new

S😎MESH[5-Manipulating-State (main)]~$ terraform apply
aws_ssm_parameter.myparameter-new: Refreshing state... [id=/myapp/myparameter]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

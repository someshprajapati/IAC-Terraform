## Built in Function in Terraform

```
S😎MESH~[2-Built-in-Functions (main)]-$ terraform version
Terraform v0.11.14

S😎MESH~[2-Built-in-Functions (main)]-$ terraform console
> help
The Terraform console allows you to experiment with Terraform interpolations.
You may access resources in the state (if you have one) just as you would
from a configuration. For example: "aws_instance.foo.id" would evaluate
to the ID of "aws_instance.foo" if it exists in your state.

Type in the interpolation to test and hit <enter> to see the result.

To exit the console, type "exit" and hit <enter>, or use Control-C or
Control-D.
```

#### String function in Terraform
```
> "Hello, This is Somesh"
"Hello, This is Somesh"

> replace("Hello, This is Somesh", "e", "#")
"H#llo, This is Som#sh"

> "The server launched at ${timestamp()}"
"The server launched at 2021-08-22T11:25:45Z"

> substr("abcd", 0, 1)
a

> substr("abcd", 0, 3)
abc

> substr("abcd", 1, 3)
bcd

> substr("abcd", -2, 1)
c
```

#### List function in Terraform
```
> list("subnet-1","subnet-2","subnet-3")
[
  "subnet-1",
  "subnet-2",
  "subnet-3",
]

> split(",", "subnet-1,subnet-2,subnet-3")
[
  "subnet-1",
  "subnet-2",
  "subnet-3",
]

> element(list("subnet-1","subnet-2","subnet-3"), 0)
subnet-1

> element(list("subnet-1","subnet-2","subnet-3"), 1)
subnet-2

> element(list("subnet-1","subnet-2","subnet-3"), 2)
subnet-3

> slice(list("subnet-1","subnet-2","subnet-3"), 0, 2)
[
  "subnet-1",
  "subnet-2",
]

> join(",", slice(list("subnet-1","subnet-2","subnet-3"), 0, 2))
subnet-1,subnet-2

> index(list("subnet-1","subnet-2","subnet-3"), "subnet-2")
1
```

#### Map function in Terraform
```
> map("eu-west-1", "ami-1", "us-east-1", "ami-2")
{
  "eu-west-1" = "ami-1"
  "us-east-1" = "ami-2"
}

> lookup(map("eu-west-1", "ami-1", "us-east-1", "ami-2"), "us-east-1")
ami-2
```

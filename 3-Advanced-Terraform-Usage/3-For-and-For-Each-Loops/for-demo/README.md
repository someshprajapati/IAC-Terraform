## For and For-each Loop in Terraform

```
S😎MESH~[3-For-and-For-Each-Loops (main)]-$ cat vars.tf
───────┴───────────────────────────────────────────────────────
       │ File: vars.tf
───────┴───────────────────────────────────────────────────────
   1   │ variable "list1" {
   2   │   type = list(string)
   3   │   default = [1, 10, 9, 101, 3]
   4   │ }
   5   │ variable "list2" {
   6   │   type = list(string)
   7   │   default = ["apple", "pear", "banana", "mango"]
   8   │ }
   9   │ variable "map1" {
  10   │   type = map(number)
  11   │   default = {
  12   │    "apple" = 5
  13   │    "pear" = 3
  14   │    "banana" = 10
  15   │    "mango" = 0
  16   │   }
  17   │ }
───────┴───────────────────────────────────────────────────────
```

#### Loop in Terraform
```
S😎MESH~[3-For-and-For-Each-Loops (main)]-$ terraform console

> [for s in ["a", "b", "c"]: s]
[
  "a",
  "b",
  "c",
]

> [for s in ["a", "b", "c"]: upper(s)]
[
  "A",
  "B",
  "C",
]

> [for s in var.list1: s + 1]
[
  2,
  11,
  10,
  102,
  4,
]

> [for s in var.list2: upper(s)]
[
  "APPLE",
  "PEAR",
  "BANANA",
  "MANGO",
]

> [for k, v in var.map1: k]
[
  "apple",
  "banana",
  "mango",
  "pear",
]

> [for k, v in var.map1: v]
[
  5,
  10,
  0,
  3,
]

> {for k, v in var.map1: k => v}
{
  "apple" = 5
  "banana" = 10
  "mango" = 0
  "pear" = 3
}
```

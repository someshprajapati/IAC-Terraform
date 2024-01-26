## Docker on AWS using ECS and ECR 

1. To initilize the terraform locally
    ```
    S😎MESH~[IAC-Terraform (main)]-$ cd 5-Docker-on-AWS/docker-demo-1
    S😎MESH~[docker-demo-1 (main)]-$ terraform init
    ```

2. To create the ECR repo using terraform
    ```
    S😎MESH~[docker-demo-1 (main)]-$ terraform apply

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

    Outputs:
    myapp-repository-URL = "992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp"
    ```

3. Clone the repo to create the image.
    ```
    S😎MESH[IAC-Terraform (main)]~$ git clone https://github.com/wardviaene/docker-demo.git

    S😎MESH[IAC-Terraform (main)]~$ cd docker-demo/

    S😎MESH[docker-demo (master)]~$ docker build -t 992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp:1 .
    Sending build context to Docker daemon  182.8kB
    Step 1/6 : FROM node
    .
    .
    Successfully built 4cb0fd2feb7a
    Successfully tagged 992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp:1

    S😎MESH[docker-demo (master)]~$ docker images
    REPOSITORY                                            TAG       IMAGE ID       CREATED         SIZE
    992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp   1         c470391cb23a   8 seconds ago   1.11GB
    node                                                  latest    97daf4a7c830   9 days ago      1.1GB
```

4. Login to AWS ECR and push the image.
```
    S😎MESH[docker-demo (master)]~$ aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 992382670122.dkr.ecr.ap-south-1.amazonaws.com
    Error saving credentials: error storing credentials - err: exec: "docker-credential-desktop": executable file not found in $PATH, out: 

    I have fixed it on Mac with this:
    sudo vim ~/.docker/config.json
    rename "credsStore" to "credStore"


    S😎MESH[docker-demo (master)]~$ vi  ~/.docker/config.json

    S😎MESH[docker-demo (master)]~$ aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 992382670122.dkr.ecr.ap-south-1.amazonaws.com
    WARNING! Your password will be stored unencrypted in /Users/someshp/.docker/config.json.
    Configure a credential helper to remove this warning. See
    https://docs.docker.com/engine/reference/commandline/login/#credentials-store

    Login Succeeded


    S😎MESH[docker-demo (master)]~$ docker push 992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp:1
    The push refers to repository [992382670122.dkr.ecr.ap-south-1.amazonaws.com/myapp]
    48bd87fcbaf6: Pushed
    .
    .
    aa904f36746c: Pushed
    1: digest: sha256:b31c0a91b78dd514265abc398b315c4c245192a5500331196b19780d8a8595d9 size: 2630
```

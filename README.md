# Provision AWS infrastructure with JSON Configuration Syntax using custom Terraform modules

This repository uses [custom modules](https://github.com/markokole/iac-aws-modules) for provisioning infrastructure to AWS.

[JSON syntax is used to provision services in the cloud.](https://www.terraform.io/docs/language/syntax/json.html)

[How to access to AWS from CLI.](https://github.com/markokole/iac-aws-modules#access-to-aws)

[Prepare Docker work environment.](https://github.com/markokole/iac-aws-modules#create-work-environment)

Folder *aws* with *credentials* should be ready now, a folder *terraform* is also created. Docker container with name, for example, aws-infra-test, is running after the below comand was executed.

```bash
docker run -itd --name aws-infra-test --env-file "aws/credentials" --volume $PWD/terraform:/local-git markokole/terraformer:1.0.3
```

Status of the running container:

```shell
CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS               NAMES
f238227f6ed9        markokole/terraformer:1.0.3   "/bin/sh"           3 seconds ago       Up 2 seconds                            aws-infra-test
```

Stepping into the container

```bash
docker exec -it aws-infra-test /bin/sh
```

brings you to the work environment. Below are some examples of how to use the modules with JSON syntax.

## Provision VPC with EC2 with public IP

[The Terraform JSON Syntax](terraform/public-ec2/provision.tf.json) provisions the VPC, Security Group and an EC2 instance with public IP. The security group opens port 22 to the client IP address just to test the infrastructure by SSH-ing to the server.

## Provision VPC with a Fargate container with public IP

[The Terraform JSON Syntax](terraform/public-ecs-fargate/provision.tf.json) provisions the VPC, Security Group and a Fargate container instance with Nginx server on it. The service is available from the client's IP on port 80.

## AWS Setup
1. Sign up for an AWS account
2. Store `AWS_ACCESS_KEY` and `AWS_SECRET_ACCESS_KEY` in environment variables or a credential file

Having the credentials setup according to AWS conventions provides better security for running these scripts.

## Terraform
This is a **Terraform** project. Download and install [Terraform](https://terraform.io/) before proceeding.

## Usage
This is a **Terraform** module.  It can be used in other Terraform scripts like this:

```
module "vpc" {
  source = "github.com/curtismitchell/aws-vpc-tf"
  cidr = "192.168.0.0/16"
  vpc_name = "My VPC"
  public_subnet_cidrs = "192.168.0.0/20,192.168.16.0/20"
  private_subnet_cidrs = "192.168.64.0/19,192.168.96.0/19"
  availability_zones = "us-east-1a,us-east-1e"
}
```

* Use an equal number of comma-separated values for `public_subnet_cidrs`, `private_subnet_cidrs` and `availability_zones`.

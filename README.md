# AWS EC2 Instance

A module to quickly deploy a mostly pre-configured EC2 instance with sensible, secure defaults conforming to all checks by Checkov and tfsec.

## Usage

In its simplest form, an instance can be deployed by specifying only `name`, `ami`, `instance_type` and `subnet_id`:

```
module "example_instance" {
  source  = "my-terraform-cloud-source/terraform-aws-ec2-instance"
  version = "~> x.x.x"

  name          = "example-ec2"
  instance_type = "t2.micro"
  subnet_id     = "12345abc"
  ami           = "abc12345"
}
```

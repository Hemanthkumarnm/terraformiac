# AWS EC2 Instance Terraform Module

This module creates one or more EC2 instances with a security group in AWS.

## Features

- Creates one or more EC2 instances with specified AMI and instance type
- Configures a security group with SSH access
- Supports custom tags
- Outputs instance IDs, public IPs, and private IPs
- Supports custom naming for multiple instances

## Usage

### Single Instance
```hcl
module "ec2_instance" {
  source = "./terraform-aws-ec2"

  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = "subnet-1234567890abcdef0"
  key_name      = "my-key-pair"
  instance_name = "my-ec2-instance"
  allowed_ssh_ip = "65.1.123.78/32"  # Optional, defaults to "65.1.123.78/32"
}
```

### Multiple Instances
```hcl
module "ec2_instances" {
  source = "./terraform-aws-ec2"

  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = "subnet-1234567890abcdef0"
  key_name      = "my-key-pair"
  instance_name = "my-ec2-instance"
  instance_count = 3  # Creates 3 instances
  
  # Optional: Custom names for each instance
  instance_names = ["web-server-1", "web-server-2", "web-server-3"]
  
  # Optional: Additional tags for all instances
  additional_tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | ID of the AMI to use for the instance | string | n/a | yes |
| instance_type | The type of instance to start | string | "t2.micro" | no |
| subnet_id | The VPC Subnet ID to launch in | string | n/a | yes |
| key_name | Key name of the Key Pair to use for the instance | string | n/a | yes |
| instance_name | Name tag for the EC2 instance | string | n/a | yes |
| allowed_ssh_ip | IP address allowed to SSH into the instance | string | "65.1.123.78/32" | no |
| instance_count | Number of instances to create | number | 1 | no |
| instance_names | List of names for multiple instances | list(string) | [] | no |
| additional_tags | Additional tags to apply to all instances | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_ids | IDs of the EC2 instances |
| instance_public_ips | Public IP addresses of the EC2 instances |
| instance_private_ips | Private IP addresses of the EC2 instances |
| security_group_id | ID of the security group |

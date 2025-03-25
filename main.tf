terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

module "ec2_instances" {
  source = "./terraform-aws-ec2/ec2-instance"

  # Required variables
  ami           = "ami-0c7217cdde317cfec"  # Ubuntu 22.04 LTS in us-east-1
  subnet_id     = "subnet-1234567890abcdef0"  # Replace with your subnet ID
  key_name      = "your-key-pair-name"  # Replace with your key pair name
  instance_name = "web-server"
  allowed_ssh_ip = "0.0.0.0/0"  # Replace with your IP address for SSH access

  # Optional variables
  instance_type = "t2.micro"
  instance_count = 2  # Create 2 instances
  
  # Optional: Custom names for instances
  instance_names = ["web-server-1", "web-server-2"]
  
  # Optional: Additional tags
  additional_tags = {
    Environment = "development"
    Project     = "my-project"
  }
}
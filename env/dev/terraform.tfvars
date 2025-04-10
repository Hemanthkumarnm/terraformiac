aws_region = "ap-south-1"
environment = "dev"
vpc_id     = "vpc-0e61cba69846da910"  # VPC ID associated with your subnet

# Web Server Configuration
web_server_ami_id        = "ami-002f6e91abff6eb96"  # Your specified AMI ID
web_server_instance_type = "t2.micro"
web_server_subnet_id     = "subnet-0e61cba69846da910"  # Your specified subnet ID
web_server_volume_size   = 8
web_server_volume_type   = "gp2"

# Common Configuration
key_name = "projects"  # Your key pair name (without .pem extension)

tags = {
  Environment = "dev"
  Project     = "multi-tier-app"
  ManagedBy   = "terraform"
  Tier        = "web"
  Owner       = "dev-team"
  Region      = "ap-south-1"
}
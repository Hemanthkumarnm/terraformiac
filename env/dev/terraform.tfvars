aws_region = "ap-south-1"
environment = "dev"
vpc_id     = "vpc-dev-xxxxxx"  # Replace with your dev VPC ID

# Web Server Configuration
web_server_ami_id        = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 AMI ID for ap-south-1
web_server_instance_type = "t2.micro"
web_server_subnet_id     = "subnet-dev-web-xxxxxx"  # Replace with your dev public subnet ID
web_server_volume_size   = 8
web_server_volume_type   = "gp2"

# Application Server Configuration
app_server_ami_id        = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 AMI ID for ap-south-1
app_server_instance_type = "t2.small"
app_server_subnet_id     = "subnet-dev-app-xxxxxx"  # Replace with your dev private subnet ID
app_server_volume_size   = 20
app_server_volume_type   = "gp2"

# Database Server Configuration
db_server_ami_id        = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 AMI ID for ap-south-1
db_server_instance_type = "t2.small"
db_server_subnet_id     = "subnet-dev-db-xxxxxx"  # Replace with your dev private subnet ID
db_server_volume_size   = 30
db_server_volume_type   = "gp2"

# Security Group CIDR Blocks
web_server_cidr = "10.0.0.0/16"  # Replace with your dev web server subnet CIDR
app_server_cidr = "10.0.1.0/16"  # Replace with your dev app server subnet CIDR

# Common Configuration
key_name = "dev-key-pair"  # Replace with your dev key pair name

tags = {
  Environment = "dev"
  Project     = "multi-tier-app"
  ManagedBy   = "terraform"
  Tier        = "multi"
  Owner       = "dev-team"
  Region      = "ap-south-1"
}
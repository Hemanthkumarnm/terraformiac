aws_region = "us-east-1"
environment = "prod"
vpc_id     = "vpc-prod-xxxxxx"  # Replace with your production VPC ID

# Web Server Configuration
web_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
web_server_instance_type = "t2.medium"
web_server_subnet_id     = "subnet-prod-web-xxxxxx"  # Replace with your production public subnet ID
web_server_volume_size   = 30
web_server_volume_type   = "gp2"

# Application Server Configuration
app_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
app_server_instance_type = "t2.large"
app_server_subnet_id     = "subnet-prod-app-xxxxxx"  # Replace with your production private subnet ID
app_server_volume_size   = 50
app_server_volume_type   = "gp2"

# Database Server Configuration
db_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
db_server_instance_type = "t2.large"
db_server_subnet_id     = "subnet-prod-db-xxxxxx"  # Replace with your production private subnet ID
db_server_volume_size   = 100
db_server_volume_type   = "gp2"

# Security Group CIDR Blocks
web_server_cidr = "10.2.0.0/16"  # Replace with your production web server subnet CIDR
app_server_cidr = "10.2.1.0/16"  # Replace with your production app server subnet CIDR

# Common Configuration
key_name = "prod-key-pair"  # Replace with your production key pair name

tags = {
  Environment = "prod"
  Project     = "multi-tier-app"
  ManagedBy   = "terraform"
  Tier        = "multi"
  Owner       = "ops-team"
} 
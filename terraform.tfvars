aws_region = "us-east-1"
environment = "dev"
vpc_id     = "vpc-xxxxxxxx"  # Replace with your VPC ID

# Web Server Configuration
web_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
web_server_instance_type = "t2.micro"
web_server_subnet_id     = "subnet-xxxxxxxx"  # Replace with your public subnet ID
web_server_volume_size   = 8
web_server_volume_type   = "gp2"

# Application Server Configuration
app_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
app_server_instance_type = "t2.medium"
app_server_subnet_id     = "subnet-xxxxxxxx"  # Replace with your private subnet ID
app_server_volume_size   = 20
app_server_volume_type   = "gp2"

# Database Server Configuration
db_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
db_server_instance_type = "t2.medium"
db_server_subnet_id     = "subnet-xxxxxxxx"  # Replace with your private subnet ID
db_server_volume_size   = 30
db_server_volume_type   = "gp2"

# Security Group CIDR Blocks
web_server_cidr = "10.0.0.0/16"  # Replace with your web server subnet CIDR
app_server_cidr = "10.0.1.0/16"  # Replace with your app server subnet CIDR

# Common Configuration
key_name = "your-key-pair-name"  # Replace with your key pair name

tags = {
  Environment = "dev"
  Project     = "multi-tier-app"
  ManagedBy   = "terraform"
  Tier        = "multi"
} 
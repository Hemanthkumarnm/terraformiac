aws_region = "us-east-1"
environment = "staging"
vpc_id     = "vpc-staging-xxxxxx"  # Replace with your staging VPC ID

# Web Server Configuration
web_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
web_server_instance_type = "t2.small"
web_server_subnet_id     = "subnet-staging-web-xxxxxx"  # Replace with your staging public subnet ID
web_server_volume_size   = 16
web_server_volume_type   = "gp2"

# Application Server Configuration
app_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
app_server_instance_type = "t2.medium"
app_server_subnet_id     = "subnet-staging-app-xxxxxx"  # Replace with your staging private subnet ID
app_server_volume_size   = 30
app_server_volume_type   = "gp2"

# Database Server Configuration
db_server_ami_id        = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
db_server_instance_type = "t2.medium"
db_server_subnet_id     = "subnet-staging-db-xxxxxx"  # Replace with your staging private subnet ID
db_server_volume_size   = 50
db_server_volume_type   = "gp2"

# Security Group CIDR Blocks
web_server_cidr = "10.1.0.0/16"  # Replace with your staging web server subnet CIDR
app_server_cidr = "10.1.1.0/16"  # Replace with your staging app server subnet CIDR

# Common Configuration
key_name = "staging-key-pair"  # Replace with your staging key pair name

tags = {
  Environment = "staging"
  Project     = "multi-tier-app"
  ManagedBy   = "terraform"
  Tier        = "multi"
  Owner       = "qa-team"
} 
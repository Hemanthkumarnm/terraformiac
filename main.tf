provider "aws" {
  region = var.aws_region
}

# Web Server Security Group
module "web_security_group" {
  source = "./modules/security-group"

  name        = "web-server-sg"
  description = "Security group for web servers"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTP access"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS access"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(var.tags, { Name = "web-server-sg" })
}

# Application Server Security Group
module "app_security_group" {
  source = "./modules/security-group"

  name        = "app-server-sg"
  description = "Security group for application servers"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTP access from web servers"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = [var.web_server_cidr]
    },
    {
      description = "Allow SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(var.tags, { Name = "app-server-sg" })
}

# Database Server Security Group
module "db_security_group" {
  source = "./modules/security-group"

  name        = "db-server-sg"
  description = "Security group for database servers"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      description = "Allow MySQL access from app servers"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = [var.app_server_cidr]
    },
    {
      description = "Allow SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(var.tags, { Name = "db-server-sg" })
}

# Web Server Instance
module "web_server" {
  source = "./modules/ec2-instance"

  ami_id              = var.web_server_ami_id
  instance_type       = var.web_server_instance_type
  subnet_id           = var.web_server_subnet_id
  security_group_ids  = [module.web_security_group.security_group_id]
  key_name            = var.key_name
  instance_name       = "web-server-${var.environment}"
  root_volume_size    = var.web_server_volume_size
  root_volume_type    = var.web_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  tags = merge(var.tags, { 
    Name = "web-server-${var.environment}"
    Role = "web"
  })
}

# Application Server Instance
module "app_server" {
  source = "./modules/ec2-instance"

  ami_id              = var.app_server_ami_id
  instance_type       = var.app_server_instance_type
  subnet_id           = var.app_server_subnet_id
  security_group_ids  = [module.app_security_group.security_group_id]
  key_name            = var.key_name
  instance_name       = "app-server-${var.environment}"
  root_volume_size    = var.app_server_volume_size
  root_volume_type    = var.app_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  tags = merge(var.tags, { 
    Name = "app-server-${var.environment}"
    Role = "app"
  })
}

# Database Server Instance
module "db_server" {
  source = "./modules/ec2-instance"

  ami_id              = var.db_server_ami_id
  instance_type       = var.db_server_instance_type
  subnet_id           = var.db_server_subnet_id
  security_group_ids  = [module.db_security_group.security_group_id]
  key_name            = var.key_name
  instance_name       = "db-server-${var.environment}"
  root_volume_size    = var.db_server_volume_size
  root_volume_type    = var.db_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  tags = merge(var.tags, { 
    Name = "db-server-${var.environment}"
    Role = "db"
  })
} 
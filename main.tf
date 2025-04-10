provider "aws" {
  region = "ap-south-1"
}

# Get current AWS account ID
data "aws_caller_identity" "current" {}

# Web Server Security Group
module "web_security_group" {
  source = "./modules/security-group"

  name        = "web-sg-${var.environment}"
  description = "Security group for web server"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP access"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS access"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]

  tags = merge(var.tags, {
    Name = "web-sg-${var.environment}"
  })
}

# Web Server Instance
module "web_server" {
  source = "./modules/ec2-instance"

  ami_id        = var.web_server_ami_id
  instance_type = var.web_server_instance_type
  subnet_id     = var.web_server_subnet_id
  key_name      = var.key_name

  security_group_ids = [module.web_security_group.security_group_id]

  root_volume_size   = var.web_server_volume_size
  root_volume_type   = var.web_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  instance_name = "minikube_latest"
  tags = merge(var.tags, {
    Name = "minikube_latest"
  })
}

# Commented out Application Server Security Group
/*
module "app_security_group" {
  source = "./modules/security-group"

  name        = "app-sg-${var.environment}"
  description = "Security group for application server"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = [var.web_server_cidr]
      description = "Allow HTTP access from web servers"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]

  tags = merge(var.tags, {
    Name = "app-sg-${var.environment}"
  })
}
*/

# Commented out Application Server Instance
/*
module "app_server" {
  source = "./modules/ec2-instance"

  ami_id        = var.app_server_ami_id
  instance_type = var.app_server_instance_type
  subnet_id     = var.app_server_subnet_id
  key_name      = var.key_name

  security_group_ids = [module.app_security_group.security_group_id]

  root_volume_size   = var.app_server_volume_size
  root_volume_type   = var.app_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  instance_name = "app-server-${var.environment}"
  tags = merge(var.tags, {
    Name = "app-server-${var.environment}"
  })
}
*/

# Commented out Database Server Security Group
/*
module "db_security_group" {
  source = "./modules/security-group"

  name        = "db-sg-${var.environment}"
  description = "Security group for database server"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = [var.app_server_cidr]
      description = "Allow MySQL access from app servers"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]

  tags = merge(var.tags, {
    Name = "db-sg-${var.environment}"
  })
}
*/

# Commented out Database Server Instance
/*
module "db_server" {
  source = "./modules/ec2-instance"

  ami_id        = var.db_server_ami_id
  instance_type = var.db_server_instance_type
  subnet_id     = var.db_server_subnet_id
  key_name      = var.key_name

  security_group_ids = [module.db_security_group.security_group_id]

  root_volume_size   = var.db_server_volume_size
  root_volume_type   = var.db_server_volume_type
  root_volume_encrypted = var.root_volume_encrypted

  instance_name = "db-server-${var.environment}"
  tags = merge(var.tags, {
    Name = "db-server-${var.environment}"
  })
}
*/
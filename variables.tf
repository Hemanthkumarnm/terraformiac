variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

# Web Server Variables
variable "web_server_ami_id" {
  description = "AMI ID for the web server"
  type        = string
}

variable "web_server_instance_type" {
  description = "Instance type for the web server"
  type        = string
  default     = "t2.micro"
}

variable "web_server_subnet_id" {
  description = "Subnet ID for the web server"
  type        = string
}

variable "web_server_volume_size" {
  description = "Root volume size for the web server"
  type        = number
  default     = 8
}

variable "web_server_volume_type" {
  description = "Root volume type for the web server"
  type        = string
  default     = "gp2"
}

# Application Server Variables
variable "app_server_ami_id" {
  description = "AMI ID for the application server"
  type        = string
}

variable "app_server_instance_type" {
  description = "Instance type for the application server"
  type        = string
  default     = "t2.medium"
}

variable "app_server_subnet_id" {
  description = "Subnet ID for the application server"
  type        = string
}

variable "app_server_volume_size" {
  description = "Root volume size for the application server"
  type        = number
  default     = 20
}

variable "app_server_volume_type" {
  description = "Root volume type for the application server"
  type        = string
  default     = "gp2"
}

# Database Server Variables
variable "db_server_ami_id" {
  description = "AMI ID for the database server"
  type        = string
}

variable "db_server_instance_type" {
  description = "Instance type for the database server"
  type        = string
  default     = "t2.medium"
}

variable "db_server_subnet_id" {
  description = "Subnet ID for the database server"
  type        = string
}

variable "db_server_volume_size" {
  description = "Root volume size for the database server"
  type        = number
  default     = 30
}

variable "db_server_volume_type" {
  description = "Root volume type for the database server"
  type        = string
  default     = "gp2"
}

# Security Group Variables
variable "web_server_cidr" {
  description = "CIDR block for web server access"
  type        = string
}

variable "app_server_cidr" {
  description = "CIDR block for application server access"
  type        = string
}

# Common Variables
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "root_volume_encrypted" {
  description = "Whether to encrypt the root volume"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
} 
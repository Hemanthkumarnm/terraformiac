variable "ami" {
  description = "ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "IP address allowed to SSH into the instance"
  type        = string
  default     = "65.1.123.78/32"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_names" {
  description = "List of names for multiple instances"
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "Additional tags to apply to all instances"
  type        = map(string)
  default     = {}
}

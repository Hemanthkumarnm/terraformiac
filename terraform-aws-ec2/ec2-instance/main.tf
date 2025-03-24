
# Get VPC ID from subnet
data "aws_subnet" "selected" {
  id = var.subnet_id
}

module "security_group" {
  source = "../security-group"

  security_group_name        = "allow_ssh"
  security_group_description = "Allow SSH inbound traffic"
  vpc_id                     = data.aws_subnet.selected.vpc_id

  ingress_rules = [
    {
      description = "SSH from specific IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.allowed_ssh_ip]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "this" {
  count = var.instance_count

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [module.security_group.security_group_id]

  tags = merge(
    {
      Name = var.instance_count > 1 ? (
        length(var.instance_names) > 0 ? var.instance_names[count.index] : "${var.instance_name}-${count.index + 1}"
      ) : var.instance_name
    },
    var.additional_tags
  )
}


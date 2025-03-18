module "ec2_instance" {
  source         = "../../modules/ec2-instance"
  ami           = "ami-12345678"   # Replace with a valid AMI ID
  instance_type = "t2.micro"
  #subnet_id     = "subnet-abcdef"  # Replace with a valid Subnet ID
  key_name      = "my-key"
  instance_name = "dev-instance"
}


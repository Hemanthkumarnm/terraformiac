module "ec2_instance" {
  source         = "../../modules/ec2-instance"
  ami           = "ami-00bb6a80f01f03502"   
  instance_type = "t2.micro"
  #subnet_id     = "subnet-abcdef"  # Replace with a valid Subnet ID
  key_name      = "my-jenkins-key"
  instance_name = "jenkins-instance"
}


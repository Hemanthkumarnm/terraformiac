provider "aws" {
  region = "ap-south-1"
}

# Get current AWS account ID
data "aws_caller_identity" "current" {} 
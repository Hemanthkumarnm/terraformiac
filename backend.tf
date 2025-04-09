terraform {
  backend "s3" {
    bucket         = "terraform-state-${data.aws_caller_identity.current.account_id}"
    key            = "multi-tier-app/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Get current AWS account ID
data "aws_caller_identity" "current" {}
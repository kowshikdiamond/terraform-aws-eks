data "aws_availability_zones" "available" {}

data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.virginia
}

################################################################################
# Variables
################################################################################

locals {
  name   = "terraform-eks"
  region = "ap-south-1"

  project = "xyz"
  environment = "abc"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Project = local.project
    Environment  = local.environment
  }
}
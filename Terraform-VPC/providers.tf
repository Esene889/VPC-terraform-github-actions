terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "peter-esene-terraformbucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}



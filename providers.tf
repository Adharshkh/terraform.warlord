
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the GitHub Provider

provider "github" {
  token = "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"
  owner = "Adharshkh"
}



provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA33Y62EU55NHUBDWZ"
  secret_key = "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"
}


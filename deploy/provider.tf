provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.39.0"
    }
  }
  backend "remote" {
    organization = "ericgoedtel"
    workspaces {
      name = "ericgoedtelcom"
    }
  }
}

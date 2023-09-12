terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">=3.2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">=2.1.0"
    }
    template = {
      source  = "hashicorp/template"
      version = ">=2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.1.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.10.0"
    }
  }
  #}

  backend "s3" {
    //NOTE: make sure the bucket exists
    // You can create bucket using setup module first
    bucket  = "billy-terraform-state-us-east-1"
    key     = "terraform/backend.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}
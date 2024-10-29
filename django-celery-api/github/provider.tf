terraform {
  required_version = ">= 1.4.6"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2.2"
    }
    local = {
      version = "~> 2.4.0"
    }
  }
}

provider "github" {
  token = var.token
  owner = var.owner
}
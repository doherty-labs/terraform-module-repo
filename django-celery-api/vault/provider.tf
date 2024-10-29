terraform {
  required_providers {
    local = {
      version = "~> 2.4.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.96.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
  }
}
provider "hcp" {
  client_id     = var.client_id
  client_secret = var.client_secret
}

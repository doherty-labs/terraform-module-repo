terraform {
  required_version = ">= 1.4.6"

  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.0.0-beta.1"
    }
  }
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.terraform_client_id
  client_secret = var.terraform_client_secret
}

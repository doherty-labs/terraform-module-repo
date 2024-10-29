terraform {
  required_version = ">= 1.4.6"
  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "~>0.8.0"
    }
  }
}

provider "ec" {
  apikey = var.ec_api_key
}
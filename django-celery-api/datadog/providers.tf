terraform {
  required_version = ">= 1.4.6"

  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.24.0"
    }
    local = {
      version = "~> 2.4.0"
    }
  }
}

provider "datadog" {
  api_key = var.api_key
  app_key = var.app_key
  api_url = var.api_url
}
terraform {
  required_providers {
    local = {
      version = "~> 2.4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.2"
    }
  }
}


provider "kubernetes" {
  host  = var.host
  token = var.token
  cluster_ca_certificate = var.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host  = var.host
    token = var.token
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}

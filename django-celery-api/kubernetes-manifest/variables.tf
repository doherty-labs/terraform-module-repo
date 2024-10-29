variable "host" {
  description = "k8 host"
  type        = string
}

variable "token" {
  description = "k8 token"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "k8 cluster_ca_certificate"
  type        = string
}

variable "docker_credentials" {
  description = "k8 docker credentials"
}

variable "cloudflare_api_token" {
  type    = string
  default = ""
}

variable "cloudflare_email" {
  type    = string
  default = ""
}

variable "cloudflare_main_domain" {
  type    = string
  default = ""
}

variable "HCP_ORG_ID" {
  type = string
}

variable "HCP_PROJECT_ID" {
  type = string
}

variable "HCP_CLIENT_ID" {
  type = string
}

variable "HCP_CLIENT_SECRET" {
  type = string
}

variable "HCP_APP_NAME" {
  type = string
}



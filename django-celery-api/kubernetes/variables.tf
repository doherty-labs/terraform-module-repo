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

resource "random_password" "password" {
  length  = 16
  special = false
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

variable "datadog_api_key" {
  type    = string
  default = ""
}

variable "redis_host" {
  type    = string
  default = ""
}

variable "redis_user" {
  type    = string
  default = ""
}

variable "redis_port" {
  type    = number
  default = 0
}

variable "redis_password" {
  type    = string
  default = ""
}

variable "env_name" {
  type    = string
  default = ""
}

variable "elastic_search_url" {
  type    = string
  default = ""
}

variable "elastic_search_username" {
  type    = string
  default = ""
}

variable "elastic_search_password" {
  type    = string
  default = ""
}

variable "raw_database_host" {
  type    = string
  default = ""
}

variable "raw_database_port" {
  type    = number
  default = 0
}

variable "raw_database_user" {
  type    = string
  default = ""
}

variable "raw_database_password" {
  type    = string
  default = ""
}

variable "raw_database_name" {
  type    = string
  default = ""
}


locals {
  rabbitmq_uri = "amqp://main_user:${random_password.password.result}@rabbitmq:5672/myvhost"
  rabbitmq_var = {
    password       = random_password.password.result
    rabbitmq_host  = "rabbitmq"
    rabbitmq_user  = "main_user"
    rabbitmq_vhost = "myvhost"
    rabbitmq_port  = 5672
    uri            = local.rabbitmq_uri
  }


  rabbitmq_values = templatefile(
    "./templates/rabbitmq_values.yaml.tmpl",
    local.rabbitmq_var
  )

  ingress_values = templatefile(
    "./templates/nginx_ingress.yaml.tmpl",
    {}
  )

  cert_manager_vars = {}
  cert_manager_values = templatefile(
    "./templates/cert_manager.yaml.tmpl",
    local.cert_manager_vars
  )

  datadog_vars = {
    api_key                = var.datadog_api_key
    redis_host             = var.redis_host
    redis_port             = var.redis_port
    redis_password         = var.redis_password
    redis_user             = var.redis_user
    env_name               = var.env_name
    elasticsearch_host     = var.elastic_search_url
    elasticsearch_username = var.elastic_search_username
    elasticsearch_password = var.elastic_search_password
    postgres_host          = var.raw_database_host
    postgres_port          = var.raw_database_port
    postgres_username      = var.raw_database_user
    postgres_password      = var.raw_database_password
    postgres_dbname        = var.raw_database_name
    rabbitmq_uri           = local.rabbitmq_uri
    rabbitmq_host          = "rabbitmq"
    rabbitmq_port          = "5672"
    rabbitmq_user          = "main_user"
    rabbitmq_vhost         = "myvhost"
    rabbitmq_password      = random_password.password.result
  }
  datadog_values = templatefile(
    "${path.module}/templates/datadog_values.yaml.tmpl",
    local.datadog_vars
  )

  external_dns_vars = {
    api_token              = var.cloudflare_api_token
    cloudflare_main_domain = var.cloudflare_main_domain
  }
  external_dns_values = templatefile(
    "./templates/external_dns_values.yaml.tmpl",
    local.external_dns_vars
  )

}



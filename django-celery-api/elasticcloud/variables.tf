variable "service_name" {
  type    = string
  default = ""
}

variable "ec_api_key" {
  type    = string
  default = ""
}

resource "random_password" "password" {
  length  = 16
  special = false
}

locals {
  elastic_search_url      = ec_deployment.es_search_service.elasticsearch.https_endpoint
  elastic_search_username = ec_deployment.es_search_service.elasticsearch_username
  elastic_search_password = ec_deployment.es_search_service.elasticsearch_password
}

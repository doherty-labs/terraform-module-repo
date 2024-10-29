variable "auth0_domain" {
  type        = string
  description = "value of the Auth0 domain"
}

variable "terraform_client_id" {
  type        = string
  description = "value of the Auth0 domain"
}

variable "terraform_client_secret" {
  type        = string
  description = "value of the Auth0 domain"
}

variable "service_name" {
  type        = string
  description = "value of the auth0 service name"
}

variable "api_host" {
  type        = string
  description = "value of the api host"
}

resource "random_id" "auth0_secret" {
  byte_length = 8
}

variable "roles" {
  type        = list(string)
  description = "List of roles to create"
}

variable "entities" {
  type        = list(string)
  description = "List of entities to create"
}

variable "permissions" {
  type        = list(string)
  description = "List of permissions for each entity"
  default = [
    "create",
    "read",
    "update",
    "delete",
    "list",
    "analytics"
  ]
}

locals {
  scopes = distinct(flatten([
    for entity in var.entities : [
      for permission in var.permissions : "${entity}:${permission}"
    ]
  ]))
  roles = distinct(flatten(var.roles))
}
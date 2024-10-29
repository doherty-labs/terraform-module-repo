
variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "project_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "org_id" {
  type = string
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
  type    = string
  default = ""
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

variable "elastic_obsv_url" {
  type    = string
  default = ""
}

variable "elastic_obsv_username" {
  type    = string
  default = ""
}

# Connection pool 

variable "pg_password" {
  type    = string
  default = ""
}

variable "pg_username" {
  type    = string
  default = ""
}

variable "pg_port" {
  type    = string
  default = ""
}

variable "pg_dbname" {
  type    = string
  default = ""
}

variable "pg_host" {
  type    = string
  default = ""
}

variable "celery_broker_url" {
  type    = string
  default = ""
}

variable "redis_url" {
  type    = string
  default = ""
}

# Raw db 

variable "raw_database_host" {
  type    = string
  default = ""
}

variable "raw_database_port" {
  type    = string
  default = ""
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

variable "rabbitmq_uri" {
  type = string
  default = ""
}

variable "rabbitmq_host" {
  type = string
  default = ""
}

variable "rabbitmq_port" {
  type = string
  default = ""
}

variable "rabbitmq_user" {
  type = string
  default = ""
}

variable "rabbitmq_vhost" {
  type = string
  default = ""
}

variable "rabbitmq_password" {
  type = string
  default = ""
}


variable "bucket_name" {
  type    = string
  default = ""
}

variable "bucket_access_key" {
  type    = string
  default = ""
}

variable "bucket_secret_key" {
  type    = string
  default = ""
}

variable "bucket_endpoint" {
  type    = string
  default = ""
}

variable "bucket_region" {
  type    = string
  default = ""
}

# CDN 

variable "cdn_bucket_name" {
  type    = string
  default = ""
}

variable "cdn_bucket_secret_key" {
  type    = string
  default = ""
}

variable "cdn_bucket_access_key" {
  type    = string
  default = ""
}

variable "cdn_bucket_endpoint" {
  type    = string
  default = ""
}

variable "cdn_bucket_region" {
  type    = string
  default = ""
}

# Auth0

variable "auth_domain" {
  type    = string
  default = ""
}

variable "auth_identifier" {
  type    = string
  default = ""
}

variable "auth_database_connection_id" {
  type    = string
  default = ""
}

variable "auth_google_connection_id" {
  type    = string
  default = ""
}

variable "auth_rest_api_client_id" {
  type    = string
  default = ""
}

variable "auth_rest_api_client_secret" {
  type    = string
  default = ""
}

variable "auth_roles" {
  type    = list(object({
    name = string
    id   = string
  }))
  default = []
}

variable "flower_user" {
  type    = string
}

variable "flower_password" {
  type    = string
}

variable "django_superuser_email" {
  type = string
}

variable "django_superuser_password" {
  type = string
}

variable "django_superuser_username" {
  type = string
}
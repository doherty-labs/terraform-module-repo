resource "hcp_project" "example" {
  name        = var.project_name
  description = "Created and managed by Terraform"
}


resource "hcp_vault_secrets_app" "rest_api_app" {
  app_name    = var.app_name
  description = "Created and managed by Terraform"
  project_id  = hcp_project.example.resource_id
}


resource "hcp_vault_secrets_secret" "redis_host" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "redis_host"
  secret_value = var.redis_host
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "redis_user" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "redis_user"
  secret_value = var.redis_user
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "redis_port" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "redis_port"
  secret_value = var.redis_port
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "redis_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "redis_password"
  secret_value = var.redis_password
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "env_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "env_name"
  secret_value = var.env_name
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "elastic_search_url" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "elastic_search_url"
  secret_value = var.elastic_search_url
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "elastic_search_username" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "elastic_search_username"
  secret_value = var.elastic_search_username
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "elastic_search_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "elastic_search_password"
  secret_value = var.elastic_search_password
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "raw_database_host" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "raw_database_host"
  secret_value = var.raw_database_host
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "raw_database_port" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "raw_database_port"
  secret_value = var.raw_database_port
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "raw_database_user" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "raw_database_user"
  secret_value = var.raw_database_user
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "raw_database_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "raw_database_password"
  secret_value = var.raw_database_password
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "raw_database_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "raw_database_name"
  secret_value = var.raw_database_name
  project_id   = hcp_project.example.resource_id
}


resource "hcp_vault_secrets_secret" "pg_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "pg_password"
  secret_value = var.pg_password
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "pg_username" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "pg_username"
  secret_value = var.pg_username
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "pg_port" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "pg_port"
  secret_value = var.pg_port
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "pg_dbname" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "pg_dbname"
  secret_value = var.pg_dbname
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "pg_host" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "pg_host"
  secret_value = var.pg_host
  project_id   = hcp_project.example.resource_id
}

resource "random_password" "django_secret_key" {
  length  = 16
  special = true
}

resource "hcp_vault_secrets_secret" "django_secret_key" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "django_secret_key"
  secret_value = "${random_password.django_secret_key.result}"
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "celery_broker_url" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "celery_broker_url"
  secret_value = var.celery_broker_url
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "redis_url" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "redis_url"
  secret_value = var.redis_url
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "bucket_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "bucket_name"
  secret_value = var.bucket_name
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "bucket_key" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "bucket_key"
  secret_value = var.bucket_access_key
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "bucket_secret" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "bucket_secret"
  secret_value = var.bucket_secret_key
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "bucket_endpoint" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "bucket_endpoint"
  secret_value = var.bucket_endpoint
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "bucket_region" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "bucket_region"
  secret_value = var.bucket_region
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "cdn_bucket_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "cdn_bucket_name"
  secret_value = var.cdn_bucket_name
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "cdn_bucket_key" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "cdn_bucket_key"
  secret_value = var.cdn_bucket_access_key
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "cdn_bucket_secret" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "cdn_bucket_secret"
  secret_value = var.cdn_bucket_secret_key
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "cdn_bucket_endpoint" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "cdn_bucket_endpoint"
  secret_value = var.cdn_bucket_endpoint
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "cdn_bucket_region" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "cdn_bucket_region"
  secret_value = var.cdn_bucket_region
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_domain" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_domain"
  secret_value = var.auth_domain
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_identifier" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_identifier"
  secret_value = var.auth_identifier
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_database_connection_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_database_connection_id"
  secret_value = var.auth_database_connection_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_google_connection_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_google_connection_id"
  secret_value = var.auth_google_connection_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_rest_api_client_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_rest_api_client_id"
  secret_value = var.auth_rest_api_client_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_rest_api_client_secret" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth_rest_api_client_secret"
  secret_value = var.auth_rest_api_client_secret
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "auth_roles" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "auth0_role_${each.value.name}_id"
  secret_value = each.value.id
  project_id   = hcp_project.example.resource_id
  for_each = { for role in var.auth_roles : role.id => role }
}


resource "hcp_vault_secrets_secret" "hcp_client_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "hcp_client_id"
  secret_value = var.client_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "hcp_client_secret" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name = "hcp_client_secret"
  secret_value = var.client_secret
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "hcp_project_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "hcp_project_name"
  secret_value = var.project_name
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "hcp_app_name" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name = "hcp_app_name"
  secret_value = var.app_name
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "hcp_org_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "hcp_org_id"
  secret_value = var.org_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "hcp_project_id" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  secret_name  = "hcp_project_id"
  secret_value = hcp_project.example.resource_id
  project_id   = hcp_project.example.resource_id
}

resource "hcp_vault_secrets_secret" "flower_user" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  project_id   = hcp_project.example.resource_id
  secret_name  = "flower_user"
  secret_value = var.flower_user
}

resource "hcp_vault_secrets_secret" "flower_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  project_id   = hcp_project.example.resource_id
  secret_name  = "flower_password"
  secret_value = var.flower_password
}

resource "hcp_vault_secrets_secret" "django_superuser_username" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  project_id   = hcp_project.example.resource_id
  secret_name  = "django_superuser_username"
  secret_value = var.django_superuser_username
}

resource "hcp_vault_secrets_secret" "django_superuser_email" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  project_id   = hcp_project.example.resource_id
  secret_name  = "django_superuser_email"
  secret_value = var.django_superuser_email
}

resource "hcp_vault_secrets_secret" "django_superuser_password" {
  app_name     = hcp_vault_secrets_app.rest_api_app.app_name
  project_id   = hcp_project.example.resource_id
  secret_name  = "django_superuser_password"
  secret_value = var.django_superuser_password
}
variable "token" {
  description = "value of DigitalOcean API token"
  type = string
}
variable "spaces_access_id" {
  description = "value of DigitalOcean access id"
  type = string
}
variable "spaces_secret_key" {
  description = "value of DigitalOcean secret key"
  type = string
}
variable "project_name" {
  description = "value of DigitalOcean project name"
  type = string
}
variable "project_description" {
  description = "value of DigitalOcean project description"
  type = string
}
variable "region" {
  description = "value of DigitalOcean region"
  type = string
}
variable "bucket_region" {
  description = "value of DigitalOcean region"
  type = string
}
variable "environment" {
  description = "value of DigitalOcean environment"
  type = string
}
variable "db_name" {
  description = "value of DigitalOcean database name"
  type = string
}
variable "db_user" {
  description = "value of DigitalOcean database user"
  type = string
}
variable "db_size" {
  description = "value of DigitalOcean database size"
  type = string
}
variable "caching_db_size" {
  description = "value of DigitalOcean database size"
  type = string
}
variable "kube_node_count" {
  description = "value of DigitalOcean kubernetes node count"
  type = number
}
variable "kube_node_pool_size" {
  description = "value of DigitalOcean kubernetes node size"
  type = string
}

variable "pg_pool_size" {
  description = "value of DigitalOcean database connection pool size"
  type = number
}

locals {
  redis_host              = digitalocean_database_cluster.redis-db.private_host
  redis_port              = digitalocean_database_cluster.redis-db.port
  redis_password          = digitalocean_database_cluster.redis-db.password
  redis_user              = digitalocean_database_cluster.redis-db.user
}
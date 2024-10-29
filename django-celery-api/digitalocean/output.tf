output "pg_password" {
  value = digitalocean_database_connection_pool.pool-01.password
  sensitive   = true
}

output "pg_username" {
  value = digitalocean_database_connection_pool.pool-01.user
  sensitive   = true
}

output "pg_port" {
  value = digitalocean_database_connection_pool.pool-01.port
  sensitive   = false
}

output "pg_dbname" {
  value = digitalocean_database_db.pg-db.name
  sensitive   = false
}

output "pg_host" {
  value = digitalocean_database_connection_pool.pool-01.private_host
  sensitive   = false
}

output "raw_pg_password" {
  value = digitalocean_database_cluster.postgres-db.password
  sensitive   = true
}

output "raw_pg_username" {
  value = digitalocean_database_cluster.postgres-db.user
  sensitive   = true
}

output "raw_pg_port" {
  value = digitalocean_database_cluster.postgres-db.port
  sensitive   = false
}

output "raw_pg_dbname" {
  value = digitalocean_database_cluster.postgres-db.database
  sensitive   = false
}

output "raw_pg_host" {
  value = digitalocean_database_cluster.postgres-db.host
  sensitive   = false
}

output "redis_uri" {
  value = "rediss://default:${local.redis_password}@${local.redis_host}:${local.redis_port}"
  sensitive = true
}

output "redis_host" {
  value = local.redis_host
  sensitive   = false
}

output "redis_port" {
  value = local.redis_port
  sensitive   = false
}

output "redis_password" {
  value = local.redis_password
  sensitive   = true
}

output "redis_user" {
  value = local.redis_user
  sensitive   = true
}

output "kubernetes_host" {
  value = digitalocean_kubernetes_cluster.kube_cluster.endpoint
  sensitive   = true
}

output "kube_ctl" {
  value = digitalocean_kubernetes_cluster.kube_cluster.kube_config[0].raw_config
  sensitive   = true
}

output "kubernetes_token" {
  value = digitalocean_kubernetes_cluster.kube_cluster.kube_config[0].token
  sensitive   = true
}

output "kubernetes_ca_cert" {
  value = base64decode(digitalocean_kubernetes_cluster.kube_cluster.kube_config[0].cluster_ca_certificate)
  sensitive   = true
}

output "bucket_name" {
  value     = digitalocean_spaces_bucket.do_bucket.name
  sensitive = false
}

output "bucket_endpoint" {
  value     = digitalocean_spaces_bucket.do_bucket.endpoint
  sensitive = false
}

output "cdn_bucket_name" {
  value     = digitalocean_spaces_bucket.do_bucket_cdn.name
  sensitive = false
}

output "cdn_bucket_endpoint" {
  value     = digitalocean_spaces_bucket.do_bucket_cdn.endpoint
  sensitive = false
}

output "cdn_domain" {
  value     = digitalocean_cdn.mycdn.endpoint
  sensitive = false
}

output "cdn_access_key" {
  value     = var.spaces_access_id
  sensitive = false
}

output "cdn_secret_key" {
  value     = var.spaces_secret_key
  sensitive = false
}

output "cdn_space_name" {
  value     = digitalocean_spaces_bucket.do_bucket_cdn.name
  sensitive = false
}

output "cdn_region" {
  value     = var.bucket_region
  sensitive = false
}

output "github_docker_creds" {
  value     = digitalocean_container_registry_docker_credentials.github_reg_creds.docker_credentials
  sensitive = true
}

output "k8_docker_creds" {
  value     = digitalocean_container_registry_docker_credentials.k8_reg_creds.docker_credentials
  sensitive = true
}

output "github_docker_url" {
  value     = digitalocean_container_registry.docker_reg.server_url
  sensitive = true
}

output "docker_reg_name" {
  value = var.project_name
}

output "cluster_name" {
  value = digitalocean_kubernetes_cluster.kube_cluster.name
}
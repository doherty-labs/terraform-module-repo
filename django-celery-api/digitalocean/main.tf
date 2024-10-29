resource "digitalocean_project" "do_project" {
  name        = var.project_name
  description = var.project_description
  purpose     = "Web Application"
  environment = var.environment
}

resource "digitalocean_project_resources" "barfoo" {
  project = digitalocean_project.do_project.id
  resources = [
    digitalocean_database_cluster.postgres-db.urn,
    digitalocean_database_cluster.redis-db.urn,
    digitalocean_kubernetes_cluster.kube_cluster.urn,
    digitalocean_spaces_bucket.do_bucket.urn,
    digitalocean_spaces_bucket.do_bucket_cdn.urn,
  ]
}

resource "digitalocean_vpc" "do_vpc" {
  name     = "${var.project_name}-network"
  region   = var.region
  ip_range = "10.10.10.0/24"
}

resource "digitalocean_database_cluster" "postgres-db" {
  name                 = "${var.project_name}-postgres-cluster"
  engine               = "pg"
  version              = "16"
  size                 = var.db_size
  region               = var.region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.do_vpc.id
  maintenance_window {
    day  = "sunday"
    hour = "04:00"
  }
}

resource "digitalocean_database_db" "pg-db" {
  cluster_id = digitalocean_database_cluster.postgres-db.id
  name       = var.db_name
}

resource "digitalocean_database_connection_pool" "pool-01" {
  cluster_id = digitalocean_database_cluster.postgres-db.id
  name       = digitalocean_database_db.pg-db.name
  mode       = "transaction"
  size       = var.pg_pool_size
  db_name    = digitalocean_database_db.pg-db.name
  user       = digitalocean_database_cluster.postgres-db.user
}

resource "digitalocean_database_cluster" "redis-db" {
  name                 = "${var.project_name}-redis-cluster"
  engine               = "redis"
  version              = "7"
  size                 = var.caching_db_size
  region               = var.region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.do_vpc.id

  maintenance_window {
    day  = "sunday"
    hour = "04:00"
  }
}

data "digitalocean_kubernetes_versions" "example" {}

resource "digitalocean_kubernetes_cluster" "kube_cluster" {
  name                             = "${var.project_name}-kubernetes-cluster"
  region                           = var.region
  version                          = "1.31.1-do.1"
  vpc_uuid                         = digitalocean_vpc.do_vpc.id
  destroy_all_associated_resources = true
  registry_integration             = true

  node_pool {
    name       = "${var.project_name}-node-pool"
    size       = var.kube_node_pool_size
    node_count = var.kube_node_count
  }
  maintenance_policy {
    day        = "sunday"
    start_time = "04:00"
  }
}

resource "digitalocean_spaces_bucket" "do_bucket" {
  name   = "${var.project_name}-bucket"
  region = var.bucket_region
}

resource "digitalocean_spaces_bucket_cors_configuration" "do_bucket_cors" {
  bucket = digitalocean_spaces_bucket.do_bucket.id
  region = var.bucket_region

  cors_rule {
    expose_headers  = ["ETag"]
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_spaces_bucket" "do_bucket_cdn" {
  name   = "${var.project_name}-cdn-bucket"
  region = var.bucket_region
  acl    = "public-read"
}

resource "digitalocean_spaces_bucket_cors_configuration" "do_bucket_cdn_cors" {
  bucket = digitalocean_spaces_bucket.do_bucket_cdn.id
  region = var.bucket_region

  cors_rule {
    expose_headers  = ["ETag"]
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_cdn" "mycdn" {
  origin = digitalocean_spaces_bucket.do_bucket_cdn.bucket_domain_name
}

resource "digitalocean_container_registry" "docker_reg" {
  name                   = var.project_name
  subscription_tier_slug = "professional"
}

resource "digitalocean_container_registry_docker_credentials" "k8_reg_creds" {
  registry_name = var.project_name
  depends_on    = [digitalocean_container_registry.docker_reg]
}

resource "digitalocean_container_registry_docker_credentials" "github_reg_creds" {
  registry_name = var.project_name
  write         = true
  depends_on    = [digitalocean_container_registry.docker_reg]
}

resource "digitalocean_database_firewall" "pg-fw" {
  cluster_id = digitalocean_database_cluster.postgres-db.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.kube_cluster.id
  }
}

resource "digitalocean_database_firewall" "redis-fw" {
  cluster_id = digitalocean_database_cluster.redis-db.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.kube_cluster.id
  }
}

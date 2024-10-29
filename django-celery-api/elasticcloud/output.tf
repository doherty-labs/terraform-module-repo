output "search_password" {
  value = local.elastic_search_password
  sensitive   = true
}

output "search_url" {
  value = local.elastic_search_url
  sensitive   = false
}

output "search_username" {
  value = local.elastic_search_username
  sensitive   = false
}

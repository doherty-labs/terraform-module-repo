output "auth0_secret" {
  value     = random_id.auth0_secret.hex
  sensitive = true
}

output "auth0_domain" {
  value     = "https://${var.auth0_domain}/"
  sensitive = false
}

output "auth0_audience" {
  value     = auth0_resource_server.my_resource_server.identifier
  sensitive = false
}

output "rest_api_client_id" {
  value     = auth0_client.rest_api.id
  sensitive = false
}

output "rest_api_client_secret" {
  value     = data.auth0_client.rest_api_client.client_secret
  sensitive = true
}

output "roles" {
  value     = [for role in auth0_role.role : { name = role.name, id = role.id }]
  sensitive = false
}

output "scopes" {
  value     = local.scopes
  sensitive = false
}
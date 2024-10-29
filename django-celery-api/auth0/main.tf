resource "auth0_resource_server" "my_resource_server" {
  name                                            = "${var.service_name} API"
  identifier                                      = "https://${var.api_host}/api/v2/"
  signing_alg                                     = "RS256"
  allow_offline_access                            = true
  token_lifetime                                  = 8600
  skip_consent_for_verifiable_first_party_clients = true
  enforce_policies                                = true
}

resource "auth0_client" "rest_api" {
  name           = "${var.service_name} REST API"
  description    = "Django REST API"
  app_type       = "non_interactive"
  is_first_party = true
  jwt_configuration {
    alg = "RS256"
  }
}

data "auth0_client" "rest_api_client" {
  client_id = auth0_client.rest_api.id
}

resource "auth0_role" "role" {
  for_each = { for role in local.roles : role => role }
  name = "${each.key}"
}

resource "auth0_resource_server_scope" "my_resource_server_scopes" {
  resource_server_identifier = auth0_resource_server.my_resource_server.identifier
  for_each = { for scope in local.scopes : scope => scope }
  scope = "${each.key}"
}

resource "auth0_client_grant" "mgmt_api_grant" {
  client_id = auth0_client.rest_api.id
  audience  = "https://${var.auth0_domain}/api/v2/"
  scopes = [
    "read:users", "create:users", "update:users", "delete:users", "read:connections",
    "read:organizations", "update:organizations", "create:organizations", "delete:organizations",
    "read:organization_members", "create:organization_members", "delete:organization_members",
    "read:organization_connections", "update:organization_connections", "create:organization_connections", "delete:organization_connections",
    "read:organization_member_roles", "create:organization_member_roles", "delete:organization_member_roles",
    "read:organization_invitations", "create:organization_invitations", "delete:organization_invitations", "read:organizations_summary", "read:roles", "create:roles", "delete:roles", "update:roles"
  ]
}

resource "auth0_client_grant" "api_grant" {
  client_id = auth0_client.rest_api.id
  audience  = auth0_resource_server.my_resource_server.identifier
  scopes = local.scopes
}
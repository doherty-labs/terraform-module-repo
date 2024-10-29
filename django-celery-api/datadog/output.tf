
output "cicd_key" {
  value = datadog_api_key.datadog_api_key.key
  sensitive = true
}
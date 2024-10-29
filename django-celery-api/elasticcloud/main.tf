data "ec_stack" "latest" {
  version_regex = "latest"
  region        = "gcp-europe-west2"
}
resource "ec_deployment" "es_search_service" {
  name                   = var.service_name
  region                 = "gcp-europe-west2"
  version                = data.ec_stack.latest.version
  deployment_template_id = "gcp-storage-optimized"

  elasticsearch = {
    topology = {
      id         = "hot_content"
      size       = "1g"
      zone_count = 1
    }
    hot = {
      autoscaling = {}
      size        = "1g"
      zone_count  = 1
    }
  }

  kibana = {}

  integrations_server = {}

  enterprise_search = {}
}

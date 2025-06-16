
resource "google_cloudfunctions2_function" "function_http_v2" {
  name = "function-${var.name}${var.resource_version}"
  location = "australia-southeast1"
  description = "function to ${var.name}"

  build_config {
    runtime = "nodejs18"
    entry_point = var.entry_point
    environment_variables = var.env_list
    source {
      storage_source {
        bucket = var.infra_bucket
        object = var.object_key
      }
    }
  }
  service_config {
    max_instance_count  = var.max_instances
    available_memory    = var.memory
    timeout_seconds     = var.timeout
    environment_variables = var.env_list
    ingress_settings = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email = var.service_account
    
  } 
}

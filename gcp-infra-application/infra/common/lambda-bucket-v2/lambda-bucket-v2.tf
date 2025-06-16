resource "google_cloudfunctions2_function" "function_bucket_v2" {
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
    vpc_connector = "${var.env}-connector"
    vpc_connector_egress_settings = "ALL_TRAFFIC"
    
  }
  event_trigger {
    trigger_region = "australia-southeast1"
    event_type = "google.cloud.storage.object.v1.finalized"
    retry_policy = "RETRY_POLICY_RETRY"
    service_account_email = var.service_account
    event_filters {
      attribute = "bucket"
      value = var.trigger_bucket_name
    }
  } 
}

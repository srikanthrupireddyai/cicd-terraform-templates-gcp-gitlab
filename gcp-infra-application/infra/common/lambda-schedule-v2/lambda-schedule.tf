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
    available_memory    = var.memory
    timeout_seconds     = var.timeout
    environment_variables = var.env_list
    ingress_settings = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email = var.service_account
    vpc_connector = "${var.env}-connector"
    vpc_connector_egress_settings = "ALL_TRAFFIC"
    
  }
}

resource "google_cloud_scheduler_job" "schedule" {
  count = var.multiple ? length(var.endpoints) : var.disable_schedule ? 0 : 1
  name        = var.multiple ? "${var.name}-${var.endpoints[count.index].endpoint}${var.resource_version}-schedule" : "${var.name}${var.resource_version}-schedule"
  description = var.multiple ? "schedule for ${var.name}-${var.endpoints[count.index].endpoint} function" : "schedule for ${var.name} function"
  schedule    = var.multiple ? var.endpoints[count.index].schedule : var.schedule
  time_zone   = var.time_zone
  attempt_deadline = "1800s"
  retry_config {
    retry_count = var.retry_count != null ? var.retry_count : 3
    min_backoff_duration = var.min_backoff_duration != null ? var.min_backoff_duration : "5s"
    max_backoff_duration = "1200s"
  }

  http_target {
    http_method = "POST"
    uri         = var.multiple ? "${google_cloudfunctions2_function.function_http_v2.service_config[0].uri}/${var.endpoints[count.index].endpoint}" : google_cloudfunctions2_function.function_http_v2.service_config[0].uri
    oidc_token {
      service_account_email = var.service_account
      audience = google_cloudfunctions2_function.function_http_v2.service_config[0].uri
    }
  }
}

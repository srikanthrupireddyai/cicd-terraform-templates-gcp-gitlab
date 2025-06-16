
resource "google_cloudfunctions_function" "function_http" {
  name        = "function-${var.name}${var.resource_version}"
  description = "function to ${var.name}"
  runtime     = "nodejs18"
  service_account_email = var.service_account
  available_memory_mb   = var.memory
  timeout               = var.timeout
  source_archive_bucket = var.infra_bucket
  source_archive_object = var.object_key
  entry_point           = var.entry_point
  trigger_http          = true

  environment_variables = var.env_list

  vpc_connector = "${var.env}-connector"
  vpc_connector_egress_settings = "ALL_TRAFFIC"
  build_environment_variables = var.build_env_list
}


resource "google_cloud_scheduler_job" "schedule" {
  count = var.multiple ? length(var.endpoints) : var.disable_schedule ? 0 : 1
  name        = var.multiple ? "${var.name}-${var.endpoints[count.index].endpoint}${var.resource_version}-schedule" : "${var.name}${var.resource_version}-schedule"
  description = var.multiple ? "schedule for ${var.name}-${var.endpoints[count.index].endpoint} function" : "schedule for ${var.name} function"
  schedule    = var.multiple ? var.endpoints[count.index].schedule : var.schedule
  time_zone   = var.time_zone
  retry_config {
    retry_count = 3
  }

  http_target {
    http_method = "POST"
    uri         = var.multiple ? "${google_cloudfunctions_function.function_http.https_trigger_url}/${var.endpoints[count.index].endpoint}" : google_cloudfunctions_function.function_http.https_trigger_url
    oidc_token {
      service_account_email = var.service_account
      audience = google_cloudfunctions_function.function_http.https_trigger_url
    }
  }
}

resource "google_cloudfunctions_function_iam_member" "invoker_http" {
  project        = google_cloudfunctions_function.function_http.project
  region         = google_cloudfunctions_function.function_http.region
  cloud_function = google_cloudfunctions_function.function_http.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${var.service_account}"
}

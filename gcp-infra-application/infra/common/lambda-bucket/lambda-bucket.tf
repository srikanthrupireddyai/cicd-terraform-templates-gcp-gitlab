
resource "google_cloudfunctions_function" "function_bucket" {
  name        = "function-${var.name}${var.resource_version}"
  description = "function to ${var.name}"
  runtime     = "nodejs18"
  service_account_email = var.service_account
  available_memory_mb   = var.memory
  timeout               = var.timeout
  source_archive_bucket = var.infra_bucket
  source_archive_object = var.object_key
  entry_point           = var.entry_point
  max_instances         = var.max_instances
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = var.trigger_bucket_name
  }

  environment_variables = var.env_list
  build_environment_variables = var.build_env_list
  vpc_connector = "${var.env}-connector"
  vpc_connector_egress_settings = "ALL_TRAFFIC"
}

resource "google_cloudfunctions_function_iam_member" "invoker_function_bucket" {
  project        = google_cloudfunctions_function.function_bucket.project
  region         = google_cloudfunctions_function.function_bucket.region
  cloud_function = google_cloudfunctions_function.function_bucket.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${var.service_account}"
}

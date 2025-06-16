
resource "google_cloudfunctions_function" "function_http" {
  name        = "function-${var.name}${var.resource_version}"
  description = "function to ${var.name}"
  runtime     = "nodejs18"

  available_memory_mb   = var.memory
  timeout               = var.timeout
  source_archive_bucket = var.infra_bucket
  source_archive_object = var.object_key
  entry_point           = var.entry_point
  trigger_http          = true
  service_account_email = var.service_account
  environment_variables = var.env_list
  max_instances         = var.max_instances

  vpc_connector = "${var.env}-connector"
  vpc_connector_egress_settings = "ALL_TRAFFIC"
  build_environment_variables = var.build_env_list
}


resource "google_cloudfunctions_function_iam_member" "invoker_function_http" {
   project        = google_cloudfunctions_function.function_http.project
  region         = google_cloudfunctions_function.function_http.region
  cloud_function = google_cloudfunctions_function.function_http.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${var.service_account}"
}


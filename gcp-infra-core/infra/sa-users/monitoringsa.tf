### gcs deployment account
resource "google_service_account" "cloud_logging_alert_account" {
  account_id  = "${local.prefix}-logging-alert"
  description = "service account for monitoring and logging alert"
}

resource "google_project_iam_member" "cloud_logging_alert_account_logging_role" {
  role    = "roles/logging.admin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.cloud_logging_alert_account.email}"
}

resource "google_project_iam_member" "cloud_logging_alert_account_monitoring_role" {
  role    = "roles/monitoring.admin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.cloud_logging_alert_account.email}"
}
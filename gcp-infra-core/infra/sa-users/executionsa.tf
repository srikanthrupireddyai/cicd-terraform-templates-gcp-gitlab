resource "google_service_account" "appilication_service_account" {
  account_id  = "${local.prefix}-application-sa"
  description = "service account for application execution"
}

resource "google_project_iam_member" "appilication_service_account_role" {
  role    = google_project_iam_custom_role.application_execution_role.id
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_service_account_viewer_role" {
  role    = "roles/viewer"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_cloudfunctions_admin_role" {
  role    = "roles/cloudfunctions.admin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_cloudfunctions_invoker_role" {
  role    = "roles/cloudfunctions.invoker"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_logging_admin_role" {
  role    = "roles/logging.admin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_logging_logWriter_role" {
  role    = "roles/logging.logWriter"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}

resource "google_project_iam_member" "appilication_secretmanager_role" {
  role    = "roles/secretmanager.secretAccessor"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_service_account.email}"
}
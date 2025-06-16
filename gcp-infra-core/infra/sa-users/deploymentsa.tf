resource "google_service_account" "appilication_deployment_account" {
  account_id  = "${local.prefix}-deployment-sa"
  description = "service account for application execution"
}

resource "google_project_iam_member" "appilication_deployment_account_role" {
  role    = google_project_iam_custom_role.application_deployment_role.id
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_deployment_account.email}"
}

resource "google_project_iam_member" "appilication_deployment_account_sa_role" {
  role    = "roles/iam.serviceAccountUser"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_deployment_account.email}"
}

resource "google_project_iam_member" "appilication_deployment_account_viewer_role" {
  role    = "roles/viewer"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.appilication_deployment_account.email}"
}
### gcs deployment account
resource "google_service_account" "artifact_account" {
  account_id  = "${local.prefix}-artifact-sa"
  description = "service account artifact"
}

resource "google_project_iam_member" "artifact_account_admin_role" {
  role    = "roles/storage.admin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.artifact_account.email}"
}

resource "google_project_iam_member" "artifact_account_object_admin_role" {
  role    = "roles/storage.objectAdmin"
  project = local.gcp_project
  member  = "serviceAccount:${google_service_account.artifact_account.email}"
}

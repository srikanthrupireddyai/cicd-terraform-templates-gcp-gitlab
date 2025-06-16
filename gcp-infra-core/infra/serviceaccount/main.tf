// serviceaccount module

resource "google_service_account" "account" {
  account_id = var.name
}

resource "google_project_iam_member" "role" {
  role    = var.role
  project = var.gcp_project_name
  member  = "serviceAccount:${google_service_account.account.email}"
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.account.name
}

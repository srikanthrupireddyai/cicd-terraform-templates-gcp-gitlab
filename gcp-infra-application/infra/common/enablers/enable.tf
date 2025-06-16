resource "google_project_service" "cloudfunctions" {
  project = local.gcp_project
  disable_dependent_services = true
  service = "cloudfunctions.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
  disable_on_destroy =  false
}

resource "google_project_service" "cloudbuildapi" {
  project = local.gcp_project
  disable_dependent_services = true
  service = "cloudbuild.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
  disable_on_destroy =  false
}

resource "google_project_service" "cloudscheduler" {
  project = local.gcp_project
  disable_dependent_services = true
  service = "cloudscheduler.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }

  disable_on_destroy =  false
}

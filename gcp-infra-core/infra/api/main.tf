resource "google_project_service" "compute_engine" {
  project                    = var.gcp_project_name
  service                    = "compute.googleapis.com"
  disable_dependent_services = true
  timeouts {
    create = "10m"
    update = "10m"
  }
  disable_on_destroy = false
}
resource "google_project_service" "iam" {
  project                    = var.gcp_project_name
  service                    = "iam.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "service_networking" {
  project                    = var.gcp_project_name
  service                    = "servicenetworking.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "sql_admin" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "sqladmin.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "os_login" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "oslogin.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "containerregistry" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "containerregistry.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "cloudrun" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "run.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "vpcaccess" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "vpcaccess.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

resource "google_project_service" "secretmanager" {
  project                    = var.gcp_project_name
  disable_dependent_services = true
  disable_on_destroy         = false
  service                    = "secretmanager.googleapis.com"
  timeouts {
    create = "10m"
    update = "10m"
  }
}

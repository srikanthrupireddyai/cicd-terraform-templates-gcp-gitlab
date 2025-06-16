locals {
  image_name =  var.image_name
}

resource "google_cloud_run_service" "cloudrun_service" {
  name     = "${var.service_name}${var.resource_version}"
  location = local.gcp_region
  metadata {
    annotations = var.service_annotations
  }
  template {
    metadata {
      annotations = var.annotations
    }

    spec {
      container_concurrency = var.container_concurrency
      timeout_seconds =  var.request_timeout
      containers {
        image = local.image_name

        dynamic env {
          for_each = var.env_list
          content {
            name = env.key
            value = env.value
          }
        }
        resources {
          limits = {
            cpu = var.cpu
            memory = var.memory
          }
        }

        dynamic env {
          for_each = var.secret_key_list
          content {
            name = env.key
            value_from {
              secret_key_ref  {
                 name = env.value
                 key = "latest"
              }
            }
          }
        }
      }
      service_account_name = var.service_account
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.cloudrun_service.name
  location = google_cloud_run_service.cloudrun_service.location
  role     = "roles/run.invoker"
  member = var.member
}

resource "google_app_engine_standard_app_version" "app" {
  project    = local.gcp_project
  version_id = var.version_id
  service    = var.name
  runtime    = "nodejs20"

  entrypoint {
    shell = "node app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${var.infra_bucket}/${var.object_key}"
    }
  }

  basic_scaling {
    max_instances = var.max_instances
  }

  env_variables             = var.env_list
  service_account           = var.service_account
  delete_service_on_destroy = true
}

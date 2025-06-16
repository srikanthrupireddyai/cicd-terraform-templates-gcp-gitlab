data "google_client_config" "this" {}
locals {
  gcp_project =  data.google_client_config.this.project
  gcp_region = data.google_client_config.this.region
  gcp_zone = "${data.google_client_config.this.region}a"
  prefix = data.google_client_config.this.project == "sample-playground-355303" ? "sample-playground" : data.google_client_config.this.project
 }

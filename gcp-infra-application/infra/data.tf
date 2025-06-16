data "google_client_config" "this" {}

locals {
  gcp_project =  data.google_client_config.this.project
  gcp_region = data.google_client_config.this.region
  gcp_zone = "${data.google_client_config.this.region}a"
  sample_db_secret_key = "secret_sampledb"
  prefix = data.google_client_config.this.project == "possible-fabric-320701" ? "sample-dev" : data.google_client_config.this.project
 }

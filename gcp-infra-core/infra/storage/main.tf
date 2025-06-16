
resource "google_storage_bucket" "infra_bucket" {
  name     = "${var.resource_prefix}-${var.env}-infra-bucket"
  location = upper(local.gcp_region)
}

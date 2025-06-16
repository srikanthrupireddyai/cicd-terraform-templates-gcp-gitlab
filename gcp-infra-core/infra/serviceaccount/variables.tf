variable "name" {
  description = "The service account name (e.g. cloud-sql-proxy)"
  type        = string
}

variable "role" {
  description = "The role assigned to the service account (e.g. roles/cloudsql.editor)"
  type        = string
}

variable "gcp_project_name" {
  description = "The name of the GCP project where the db and Cloud SQL Proxy will be created"
  type        = string
}

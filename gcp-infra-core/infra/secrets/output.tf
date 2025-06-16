output "secret_key" {
  value = google_secret_manager_secret.secret.name
}

output "secret_key_version" {
  value = google_secret_manager_secret_version.secret_version.name
}

output "secret_name" {
  value = var.secret_id
}

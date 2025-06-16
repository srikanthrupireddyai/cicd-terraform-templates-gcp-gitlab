output "url" {
  value = "${google_cloudfunctions2_function.function_http_v2.service_config[0].uri}"
}

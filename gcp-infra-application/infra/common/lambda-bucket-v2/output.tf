output "function_uri" { 
  value = google_cloudfunctions2_function.function_bucket_v2.service_config[0].uri
}

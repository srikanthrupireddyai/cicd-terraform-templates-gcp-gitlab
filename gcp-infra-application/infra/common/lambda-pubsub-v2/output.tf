output "topic_path" {
  value = length(google_pubsub_topic.pubsub_topic) > 0 ? google_pubsub_topic.pubsub_topic[0].id : null
}

output "dead_letter_path" {
  value = length(google_pubsub_topic.pubsub_dead_letter_topic) > 0 ? google_pubsub_topic.pubsub_dead_letter_topic[0].id : null
}

output "uri" {
  value = google_cloudfunctions2_function.function_pubsub_v2.service_config[0].uri
}

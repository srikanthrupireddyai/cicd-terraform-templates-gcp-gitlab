resource "google_cloudfunctions2_function" "function_pubsub_v2" {
  name = "function-${var.name}${var.resource_version}"
  location = "australia-southeast1"
  description = "function to ${var.name}"

  build_config {
    runtime = "nodejs18"
    entry_point = var.entry_point
    environment_variables = var.env_list
    source {
      storage_source {
        bucket = var.infra_bucket
        object = var.object_key
      }
    }
  }
  service_config {
    max_instance_count  = var.max_instances
    max_instance_request_concurrency = 80
    available_memory    = var.memory
    timeout_seconds     = var.timeout
    available_cpu       = "2"
    environment_variables = var.env_list
    ingress_settings = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email = var.service_account
    
  }
}

resource "google_pubsub_topic" "pubsub_topic" {
  count = var.create_topic ? 1 : 0
  name = "pubsub-${var.name}${var.resource_version}-topic"
}
resource "google_pubsub_topic" "pubsub_dead_letter_topic" {
  count = var.create_dead_letter ? 1 : 0
  name = "pubsub-${var.name}${var.resource_version}-topic-dead-letter"
}

resource "google_pubsub_subscription" "pubsub_subcsription" {
  name  = "pubsub-${var.name}${var.resource_version}-topic-subscription"
  topic = var.create_topic ? google_pubsub_topic.pubsub_topic[0].name : var.subscribe_to
  ack_deadline_seconds = 600
  push_config {
    push_endpoint = google_cloudfunctions2_function.function_pubsub_v2.service_config[0].uri
    oidc_token {
      service_account_email = var.service_account
    }
  }  
  retry_policy {
    minimum_backoff = var.minimum_backoff
  }

  dead_letter_policy {
    dead_letter_topic     = var.create_dead_letter ? google_pubsub_topic.pubsub_dead_letter_topic[0].id : var.dead_letter_path
    max_delivery_attempts = var.max_delivery_attempts
  }
}

resource "google_pubsub_subscription" "pubsub_dead_letter_subcsription" {
  name  = "pubsub-${var.name}${var.resource_version}-dead-letter-subscription"
  topic = var.create_dead_letter ? google_pubsub_topic.pubsub_dead_letter_topic[0].id : var.dead_letter_path
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds = 20
  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }
  enable_message_ordering    = true
}


resource "google_cloudfunctions_function" "function_pubsub" {
  name        = "function-${var.name}${var.resource_version}"
  description = "function to ${var.name}"
  runtime     = "nodejs18"

  available_memory_mb   = var.memory
  timeout               = var.timeout
  source_archive_bucket = var.infra_bucket
  source_archive_object = var.object_key
  entry_point           = var.entry_point
  trigger_http          = true
  service_account_email = var.service_account
  environment_variables = var.env_list
  max_instances         = var.max_instances

  vpc_connector = "${var.env}-connector"
  vpc_connector_egress_settings = "ALL_TRAFFIC"
  build_environment_variables = var.build_env_list
}

resource "google_pubsub_topic" "pubsub_topic" {
  count = var.create_topic ? 1 : 0
  name = "pubsub-${var.name}${var.resource_version}-topic"
}

resource "google_cloudfunctions_function_iam_member" "invoker_function_pubsub" {
  project        = google_cloudfunctions_function.function_pubsub.project
  region         = google_cloudfunctions_function.function_pubsub.region
  cloud_function = google_cloudfunctions_function.function_pubsub.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${var.service_account}"
}

resource "google_pubsub_topic" "pubsub_dead_letter_topic" {
  count = var.create_dead_letter ? 1 : 0
  name = "pubsub-${var.name}${var.resource_version}-topic-dead-letter"
}

resource "google_pubsub_subscription" "pubsub_subcsription" {
  name  = "pubsub-${var.name}${var.resource_version}-topic-subscription"
  topic = var.create_topic ? google_pubsub_topic.pubsub_topic[0].name : var.subscribe_to

  push_config {
    push_endpoint = google_cloudfunctions_function.function_pubsub.https_trigger_url
    oidc_token {
      service_account_email = var.service_account
    }
  }
  retry_policy {
    minimum_backoff = "50s"
  }

  dead_letter_policy {
    dead_letter_topic     = var.create_dead_letter ? google_pubsub_topic.pubsub_dead_letter_topic[0].id : var.dead_letter_path
    max_delivery_attempts = 10
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

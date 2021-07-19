resource "google_pubsub_topic" "pubsub_topic" {
  project = var.gcp_project_id
  name    = "task01-topic"
}

resource "google_pubsub_subscription" "pubsub_sub" {
  name    = "task01-subscription"
  project = var.gcp_project_id
  topic   = google_pubsub_topic.pubsub_topic.name

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = ""
  }

  depends_on = [google_pubsub_topic.pubsub_topic]
}
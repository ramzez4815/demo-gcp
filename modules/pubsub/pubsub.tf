resource "google_pubsub_topic" "pubsub_topic" {
  project = var.project_id
  name    = var.pubsub_topic_name
}

resource "google_pubsub_subscription" "pubsub_sub" {
  name    = var.pubsub_sub_name
  project = var.project_id
  topic   = google_pubsub_topic.pubsub_topic.name

  ack_deadline_seconds = var.ack_deadline

  expiration_policy {
    ttl = ""
  }

  depends_on = [google_pubsub_topic.pubsub_topic]
}
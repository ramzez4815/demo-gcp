resource "google_cloud_scheduler_job" "job" {
  name        = var.scheduler_name
  description = var.scheduler_description
  schedule    = "* * * * *"
  project     = var.gcp_project_id
  region      = var.gcp_region
  time_zone   = var.scheduler_time_zone


  pubsub_target {
    topic_name = var.pubsub_topic_name
    data       = base64encode("[ { \"name\":\"Ramses\" } ]")
  }

  depends_on = [google_pubsub_subscription.pubsub_sub]
}




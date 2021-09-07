resource "google_cloud_scheduler_job" "job" {
  name        = var.scheduler_name
  description = var.scheduler_description
  schedule    = "* * * * *"
  project     = var.project_id
  region      = var.scheduler_region
  time_zone   = var.scheduler_time_zone


  pubsub_target {
    topic_name = var.pubsub_topic_name
    data       = base64encode("[ { \"name\":\"Ramses\" } ]")
  }

}




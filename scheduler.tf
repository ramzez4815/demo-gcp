resource "google_cloud_scheduler_job" "job" {
  name        = "task01-job"
  description = "task01 job"
  schedule    = "* * * * *"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_region}"
  time_zone   = "America/Mexico_City"


  pubsub_target {
    topic_name = "projects/epam-001/topics/task01-topic"
    data       = base64encode("[ { name:Ramses } ]")    
  }

  depends_on    = [ google_pubsub_subscription.pubsub_sub ]
}
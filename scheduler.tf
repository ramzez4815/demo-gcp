# resource "google_app_engine_application" "app_engine" {
#   project     = "${var.gcp_project_id}"
#   location_id = "us-central"
# }

resource "google_cloud_scheduler_job" "job" {
  name        = "task01-job"
  description = "task01 job"
  schedule    = "* * * * *"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_region}"
  time_zone   = "America/Mexico_City"


  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = "projects/epam-001/topics/task01-topic"
    data       = base64encode("[ { name:Ramses } ]")    
  }

  depends_on    = [ google_pubsub_subscription.pubsub_sub ]
}
resource "google_service_account" "gce-sa" {
  account_id   = "gce-sa"
  display_name = "gce_sa"
}

resource "google_project_iam_member" "gce-iam" {
  project = "epam-001"
  role    = "projects/epam-001/roles/pubsub_resource"
  member  = "serviceAccount:${google_service_account.gce-sa.email}"
}
resource "google_service_account" "gce-sa" {
  account_id   = "gce_sa"
  display_name = "gce-sa"
}

resource "google_project_iam_member" "gce-iam" {
  project = "epam-001"
  role    = "pubsub-resource"
  member  = "serviceAccount:${google_service_account.gce_sa.email}"
}
resource "google_storage_bucket" "bucket" {
  name                        = var.gcs_name
  location                    = var.gcs_region
  project                     = var.gcp_project_id
  uniform_bucket_level_access = true
  force_destroy               = true
}
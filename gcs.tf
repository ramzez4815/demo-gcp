resource "google_storage_bucket" "bucket" {
  name     = "task01-bucket"
  location = "us-central1" //default 
  #force_destroy = true
  project                     = var.gcp_project_id
  uniform_bucket_level_access = true
  force_destroy               = true
}
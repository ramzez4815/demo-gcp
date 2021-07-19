terraform {
  backend "gcs" {
    bucket = "tf-state-task01"
    prefix = "terraform/state"
  }
}
resource "google_service_account" "gce-sa" {
  account_id   = var.sa_account_id
  display_name = var.sa_display_name
}

resource "google_project_iam_member" "gce-iam" {
  project = var.project_id
  role    = var.sa_role
  member  = "serviceAccount:${google_service_account.gce-sa.email}"
}

resource "google_compute_instance" "vm-instance" {
  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone
  tags         = [var.gce_tag]

  boot_disk {
    initialize_params {
      image = var.gce_os
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  network_interface {
    subnetwork = var.gce_subnetwork_name
    access_config {}
  }

  service_account {
    email  = google_service_account.gce-sa.email
    scopes = ["cloud-platform"]
  }
}
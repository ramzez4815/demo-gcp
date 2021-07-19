resource "google_compute_instance" "vm-instance" {
  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone
  tags         = ["vm-instance"]

  boot_disk {
    initialize_params {
      image = var.gce_os
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork.name
    access_config {}
  }

  service_account {
    email  = google_service_account.gce-sa.email
    scopes = ["cloud-platform"]
  }
}
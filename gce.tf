resource "google_compute_instance" "vm-instance" {
    name         = "task01-vm"
    machine_type = "e2-standard-2" 
    zone         = "us-central1-a" 
    tags         = ["vm-instance"]    

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    metadata_startup_script = file("${path.module}/startup.sh")

    network_interface {
        subnetwork = "${google_compute_subnetwork.subnetwork.name}"
        access_config {}
    }

    service_account {
        # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
        email  = google_service_account.gce-sa.email
        scopes = ["cloud-platform"]
  }
}
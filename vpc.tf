resource "google_compute_network" "vpc_network" {
  name                    = "task01-vpc"
  mtu                     = "1460"
  auto_create_subnetworks = false
  project                 = "epam-001"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "task01-subnet"
  ip_cidr_range = "187.232.111.0/24"
  region        = "us-central1"
  network       = "task01-vpc"
  depends_on    = [google_compute_network.vpc_network]

}

resource "google_compute_firewall" "allow-ssh" {
  name    = "task01-firewall"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["vm-instance"]
  source_ranges = ["0.0.0.0/0"]

  depends_on = [google_compute_subnetwork.subnetwork]
}
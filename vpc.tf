resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  mtu                     = var.vpc_mtu
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  project                 = var.gcp_project_id
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = "187.232.111.0/24"
  region        = var.subnet_region
  network       = var.vpc_name
  depends_on    = [google_compute_network.vpc_network]

}

resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["vm-instance"]
  source_ranges = ["0.0.0.0/0"]

  depends_on = [google_compute_subnetwork.subnetwork]
}
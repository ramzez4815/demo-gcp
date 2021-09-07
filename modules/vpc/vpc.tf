resource "google_compute_network" "vpc_network" {
  name                    = var.gce_network_name
  mtu                     = var.vpc_mtu
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.gce_subnetwork_name
  ip_cidr_range = var.gce_subnet_ip
  region        = var.subnet_region
  network       = var.gce_network_name
  depends_on    = [google_compute_network.vpc_network]

}

resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.name
  allow {
    protocol = var.gce_firewall_protocol
    ports    = [var.gce_firewall_port]
  }
  target_tags   = [var.gce_firewall_target]
  source_ranges = [var.gce_firewall_range]

  depends_on = [google_compute_subnetwork.subnetwork]
}
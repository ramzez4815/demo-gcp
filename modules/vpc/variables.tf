variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "subnet_region" {
  type        = string
  description = "Subnet Region"
}
variable "gce_network_name" {
  type        = string
  description = "Network Name"
}
variable "vpc_mtu" {
  type        = number
  description = "VPC MTU Value"
}
variable "vpc_auto_create_subnetworks" {
  type        = bool
  description = "VPC Autocreate subnetwork flag"
}
variable "gce_subnetwork_name" {
  type        = string
  description = "Subnetwork Name"
}
variable "gce_subnet_ip" {
  type        = string
  description = "GCE Subnetwork IP"
}
variable "firewall_name" {
  type        = string
  description = "Firewall Name"
}
variable "gce_firewall_protocol" {
  type        = string
  description = "GCE Firewall Protocol"
}
variable "gce_firewall_port" {
  type        = string
  description = "GCE Firewall Port"
}
variable "gce_firewall_range" {
  type        = string
  description = "GCE Firewall Range"
}
variable "gce_firewall_target" {
  type        = string
  description = "GCE Firewall Target"
}
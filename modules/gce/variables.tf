variable "gce_name" {
  type        = string
  description = "GCE Name"
}
variable "gce_machine_type" {
  type        = string
  description = "GCE Machine Type"
}
variable "gce_zone" {
  type        = string
  description = "GCE Zone"
}
variable "gce_os" {
  type        = string
  description = "GCE OS"
}
variable "gce_tag" {
  type        = string
  description = "GCE Tag"
}
variable "gce_subnetwork_name" {
  type        = string
  description = "Subnetwork Name"
}
variable "sa_account_id" {
  type        = string
  description = "Service Account accountID"
}
variable "sa_display_name" {
  type        = string
  description = "Service Account Display Name"
}
variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "sa_role" {
  type        = string
  description = "Service Account Role"
}
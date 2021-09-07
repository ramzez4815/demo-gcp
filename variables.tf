variable "project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "bucket_name" {
  type        = string
  description = "GCS Name"
}
variable "uniform_bucket_level_access" {
  type        = bool
  description = "Bucket Level Access"
}
variable "force_destroy" {
  type        = bool
  description = "Bucket Force Destroy"
}
variable "gcs_region" {
  type        = string
  description = "GCS Region"
}
variable "sa_account_id" {
  type        = string
  description = "Service Account accountID"
}
variable "sa_display_name" {
  type        = string
  description = "Service Account Display Name"
}
variable "sa_role" {
  type        = string
  description = "Service Account Role"
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
variable "gcp_region" {
  type        = string
  description = "GCP Region"
}
variable "pubsub_topic_name" {
  type        = string
  description = "Pubsub topic name"
}
variable "pubsub_sub_name" {
  type        = string
  description = "PubSub Subscriber Name"
}
variable "ack_deadline" {
  type        = number
  description = "PubSub Ack Deadline"
}
variable "scheduler_time_zone" {
  type        = string
  description = "Scheduler Time Zone"
}
variable "scheduler_name" {
  type        = string
  description = "Scheduler name"
}
variable "scheduler_description" {
  type        = string
  description = "Scheduler name"
}
variable "scheduler_region" {
  type        = string
  description = "Scheduler Region"
}
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








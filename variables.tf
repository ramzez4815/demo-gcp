variable "gcp_region" {
  type        = string
  description = "GCP Region"
}
variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
}
variable "pubsub_topic_name" {
  type        = string
  description = "Pubsub topic name"
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
variable "vpc_auto_create_subnetworks" {
  type        = bool
  description = "VPC Autocreate subnetwork flag"
}
variable "vpc_mtu" {
  type        = number
  description = "VPC MTU Value"
}
variable "pubsub_topic" {
  type        = string
  description = "PubSub Topic Name"
}
variable "pubsub_sub_name" {
  type        = string
  description = "PubSub Subscriber Name"
}
variable "gcs_region" {
  type        = string
  description = "GCS Region"
}
variable "gcs_name" {
  type        = string
  description = "GCS Name"
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

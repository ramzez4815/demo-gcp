module "bucket" {
  source = "./modules/bucket"
  bucket_name = var.bucket_name
  gcs_region = var.gcs_region
  project_id = var.project_id
  uniform_bucket_level_access = var.uniform_bucket_level_access
  force_destroy = var.force_destroy
}
module "vpc" {
  source                      = "./modules/vpc"
  project_id                  = var.project_id
  subnet_region               = var.subnet_region
  gce_network_name            = var.gce_network_name
  vpc_auto_create_subnetworks = var.vpc_auto_create_subnetworks
  vpc_mtu                     = var.vpc_mtu
  gce_subnetwork_name         = var.gce_subnetwork_name
  gce_subnet_ip               = var.gce_subnet_ip
  firewall_name               = var.firewall_name
  gce_firewall_target         = var.gce_firewall_target
  gce_firewall_range          = var.gce_firewall_range
  gce_firewall_protocol       = var.gce_firewall_protocol
  gce_firewall_port           = var.gce_firewall_port
}
module "pubsub" {
  source = "./modules/pubsub"
  pubsub_topic_name = var.pubsub_topic_name
  pubsub_sub_name = var.pubsub_sub_name
  project_id = var.project_id
  ack_deadline = var.ack_deadline  
}
module "scheduler" {
  source = "./modules/scheduler"
  scheduler_name = var.scheduler_name
  scheduler_description = var.scheduler_description
  project_id = var.project_id
  scheduler_time_zone = var.scheduler_time_zone  
  pubsub_topic_name = var.pubsub_topic_name
  scheduler_region = var.scheduler_region

  depends_on = [module.pubsub]
}
module "gce" {
  source = "./modules/gce"
  gce_name = var.gce_name
  gce_machine_type = var.gce_machine_type
  gce_zone = var.gce_zone
  gce_os = var.gce_os  
  gce_tag = var.gce_tag
  gce_subnetwork_name = var.gce_subnetwork_name
  project_id = var.project_id
  sa_role = var.sa_role
  sa_account_id = var.sa_account_id
  sa_display_name = var.sa_display_name

  depends_on = [module.vpc]
}
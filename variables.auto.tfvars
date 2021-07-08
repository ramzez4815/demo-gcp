gcp_project_id              = "epam-001"
gcp_region                  = "us-central1"


gke_custler_name            = "epam-cluster"
gke_location                = "us-central1-b"
gke_zones                   = ["us-central1-b"]
gke_regional                = false
gke_network_name            = "gke-network"
gke_subnetwork_name         = "gke-subnet"
gke_horizontal_autoscaling  = false
gke_load_balancer           = false
gke_node_pool_name          = "gke-epam-node"
gke_service_account         = "gke-service-account@epam-001.iam.gserviceaccount.com"
vpc_auto_create_subnetworks = false
vpc_mtu                     = 1460
gke_router_name             = "gke-router"
gke_nat_name                = "gke-nat"
gke_machine_type            = "n1-standard-1"
gke_disk_type               = "pd-standard"
gke_pod_range               = "pod-ip-range"
gke_service_range           = "service-ip-range"
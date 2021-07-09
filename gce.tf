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

    metadata = {
        startup-script = <<SCRIPT
        echo "#!/bin/bash" > /home/ubuntu/demo_task01.sh
        echo '/snap/bin/gcloud pubsub subscriptions pull task01-subscription --auto-ack --limit=10 --format='\''value(DATA)'\'' > /home/ubuntu/output_`date +%d-%m-%Y_%H:%M:%S`.json' >> /home/ubuntu/demo_task01.sh
        echo "/snap/bin/gsutil cp /home/ubuntu/output* gs://task01-bucket/" >> /home/ubuntu/demo_task01.sh
        echo "rm -rf /home/ubuntu/output* " >> /home/ubuntu/demo_task01.sh
        chmod +x /home/ubuntu/demo_task01.sh
        echo "*/5 * * * * /home/ubuntu/demo_task01.sh" | /usr/bin/crontab
        SCRIPT
    } 

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
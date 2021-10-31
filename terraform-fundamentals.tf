# Get started with Terraform in Google Cloud.

# Install Terraform from installation binaries.

# Create a VM instance infrastructure using Terraform.

# gcloud auth list
# gcloud config list project

# terraform

#Update Terraform

# wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
# unzip terraform_0.13.0_linux_amd64.zip 
# sudo mv terraform /usr/local/bin/
# terraform -v

#-------------------Build infrastructure

#create an empty configuration file named instance.tf
# touch instance.tf

resource "google_compute_instance" "terraform" {
  project      = "<PROJECT_ID>"
  name         = "terraform"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}


#sed -i -e 's/<PROJECT_ID>/'$DEVSHELL_PROJECT_ID/ instance.tf

# terraform init 
# terraform plan
# terraform apply
# terraform show





#$ terraform show
# google_compute_instance.terraform:
resource "google_compute_instance" "terraform" {
    can_ip_forward       = false
    cpu_platform         = "Intel Haswell"
    current_status       = "RUNNING"
    deletion_protection  = false
    enable_display       = false
    guest_accelerator    = []
    id                   = "projects/qwiklabs-gcp-04-0eae855a7530/zones/us-central1-a/instances/terraform"
    instance_id          = "4522356452850116069"
    label_fingerprint    = "42WmSpB8rSM="
    machine_type         = "n1-standard-1"
    metadata_fingerprint = "w3YFlK7kamY="
    name                 = "terraform"
    project              = "qwiklabs-gcp-04-0eae855a7530"
    self_link            = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-0eae855a7530/zones/us-central1-a/instances/terraform"
    tags_fingerprint     = "42WmSpB8rSM="
    zone                 = "us-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "persistent-disk-0"
        mode        = "READ_WRITE"
        source      = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-0eae855a7530/zones/us-central1-a/disks/terraform"

        initialize_params {
            image  = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20211028"
            labels = {}
            size   = 10
            type   = "pd-standard"
        }
    }

    network_interface {
        name               = "nic0"
        network            = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-0eae855a7530/global/networks/default"
        network_ip         = "10.128.0.2"
        stack_type         = "IPV4_ONLY"
        subnetwork         = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-04-0eae855a7530/regions/us-central1/subnetworks/default"
        subnetwork_project = "qwiklabs-gcp-04-0eae855a7530"

        access_config {
            nat_ip       = "35.192.42.243"
            network_tier = "PREMIUM"
        }
    }

    scheduling {
        automatic_restart   = true
        min_node_cpus       = 0
        on_host_maintenance = "MIGRATE"
        preemptible         = false
    }
}
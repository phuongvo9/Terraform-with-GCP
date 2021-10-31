# Build, change, and destroy infrastructure with Terraform

# Create Resource Dependencies with Terraform

# Provision infrastructure with Terraform


terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  version = "3.5.0"
  project = "<PROJECT_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}
#sed -i -e 's/<PROJECT_ID>/'$DEVSHELL_PROJECT_ID/ main.tf

#terraform init
#terraform plan
#terraform apply

#nano main.tf
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
#   network_interface {
#     network = google_compute_network.vpc_network.name
#     access_config {
#     }
#   }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}


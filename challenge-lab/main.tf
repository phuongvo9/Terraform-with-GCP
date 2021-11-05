terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source = "./modules/instances"
  
}

### IMPORT EXIST Instances

resource "google_compute_instance" "tf-instance-1" {
  
}

resource "google_compute_instance" "tf-instance-2" {
  
}


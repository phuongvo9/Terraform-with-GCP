# terraform {
#   required_providers {
#     google = {
#       source = "hashicorp/google"
#       version = "3.55.0"
#     }
#   }
# }

##### REMOTE BACKEND with GCS ####
terraform {
  backend "gcs" {
    bucket  = "tf-bucket-550252"
    prefix  = "terraform/state"
  }
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
module "storage" {
  source     = "./modules/storage"
}
### IMPORT EXIST Instances

# terraform import module.instances.google_compute_instance.tf-instance-1 3242972002728521865

# terraform import module.instances.google_compute_instance.tf-instance-2 5326079957886808201

## TASK 6 - Create VPC with 2 subnets via Module in (remote) registry
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.2.2"

    project_id   = var.project_id
    network_name = "tf-vpc-179675"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "Create VPC with 2 subnet in Task 6 - 6 Nov 2021"
        }
    ]
}

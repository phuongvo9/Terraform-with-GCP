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
module "storage" {
  source     = "./modules/storage"
}




### IMPORT EXIST Instances

    # Name
    # tf-instance-1
    # Instance Id
    # 3242972002728521865

    # # 

    # Name
    # tf-instance-2
    # Instance Id
    # 5326079957886808201


# terraform import module.instances.google_compute_instance.tf-instance-1 3242972002728521865

# terraform import module.instances.google_compute_instance.tf-instance-2 5326079957886808201


# # terraform apply will update the instances in-place.
# terraform plan
# terraform apply
# terraform show
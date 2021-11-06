# Import existing infrastructure into your Terraform configuration.

# Build and reference your own Terraform modules.

# Add a remote backend to your configuration.

# Use and implement a module from the Terraform Registry.

# Re-provision, destroy, and update infrastructure.

# Test connectivity between the resources you've created


// --------------------------------
# Find Instance ID, boot disk image, and machine type to import

touch main.tf
touch variables.tf
mkdir modules
cd modules
mkdir instances
cd instances
touch instances.tf
touch outputs.tf
touch variables.tf
cd ..
mkdir storage
cd storage
touch storage.tf
touch outputs.tf
touch variables.tf
cd ~


nano variables.tf
variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "project_id" {
  default = "qwiklabs-gcp-02-fd29397e9a20"
}



#### MAIN
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  project_id = var.project_id
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


terraform import module.instances.google_compute_instance.tf-instance-1 3242972002728521865

terraform import module.instances.google_compute_instance.tf-instance-2 5326079957886808201
terraform import module.instances.google_compute_instance.tf-instance-273537 4710153760417748154

# terraform apply will update the instances in-place.
terraform plan
terraform apply
terraform show

### Move state from Local backend to Remote backend GCS

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


####
terraform init -migrate-state


####
terraform taint module.instances.google_compute_instance.tf-instance-707450

terraform init
terraform apply


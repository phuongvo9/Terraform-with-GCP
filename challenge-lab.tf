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
cd


variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "project_id" {
  default = "qwiklabs-gcp-04-5347103590cd"
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

terraform import module.instances.google_compute_instance.tf-instance-1 5531094827282250532

terraform import module.instances.google_compute_instance.tf-instance-2 5543777857117403940


terraform plan


### Move state from Local backend to Remote backend GCS

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-279401"
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


# Use a module from the Registry

# Build a module

git clone https://github.com/terraform-google-modules/terraform-google-network
cd terraform-google-network
git checkout tags/v3.3.0 -b v3.3.0

gcloud config list --format 'value(core.project)'

variable "project_id" {
  description = "The project ID to host the network in"
  default     = "FILL IN YOUR PROJECT ID HERE"
}

variable "network_name" {
  description = "The name of the VPC network being created"
  default     = "example-vpc"
}



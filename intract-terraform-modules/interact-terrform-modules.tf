# Use a module from the Registry

# Build a module

# git clone https://github.com/terraform-google-modules/terraform-google-network
# cd terraform-google-network
# git checkout tags/v3.3.0 -b v3.3.0

# gcloud config list --format 'value(core.project)'

variable "project_id" {
  description = "The project ID to host the network in"
  default     = "qwiklabs-gcp-01-80b9a90852bc"
}

variable "network_name" {
  description = "The name of the VPC network being created"
  default     = "example-vpc"
}


variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-01-80b9a90852bc"
}
variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "qwiklabs-gcp-01-80b9a90852bc-bucket"
}

# gsutil cp *.html gs://qwiklabs-gcp-01-80b9a90852bc-bucket
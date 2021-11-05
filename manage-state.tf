

# touch main.tf
# Project ID qwiklabs-gcp-03-ed84d35ff4a4

#Get project ID gcloud config list --format 'value(core.project)'

provider "google" {
  project     = "qwiklabs-gcp-03-ed84d35ff4a4"
  region      = "us-central-1"
}
resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "qwiklabs-gcp-03-ed84d35ff4a4"
  location    = "US"
  uniform_bucket_level_access = true
}

# Add local backend to our main file *.tf
    #terraform.tfstate file in the terraform/state directory. To specify a different file path, change the path variable.
terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}


### Change to remote backend
terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-03-ed84d35ff4a4"
    prefix  = "terraform/state"
  }
}

terraform init -migrate-state

terraform refresh

terraform show
# # google_storage_bucket.test-bucket-for-state:
# resource "google_storage_bucket" "test-bucket-for-state" {
#     default_event_based_hold    = false
#     force_destroy               = false
#     id                          = "qwiklabs-gcp-03-ed84d35ff4a4"
#     labels                      = {
#         "key" = "value"
#     }
#     location                    = "US"
#     name                        = "qwiklabs-gcp-03-ed84d35ff4a4"
#     project                     = "qwiklabs-gcp-03-ed84d35ff4a4"
#     requester_pays              = false
#     self_link                   = "https://www.googleapis.com/storage/v1/b/qwiklabs-gcp-03-ed84d35ff4a4"
#     storage_class               = "STANDARD"
#     uniform_bucket_level_access = true
#     url                         = "gs://qwiklabs-gcp-03-ed84d35ff4a4"
# }

# 
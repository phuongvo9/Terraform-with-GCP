# Get started with Terraform in Google Cloud.

# Install Terraform from installation binaries.

# Create a VM instance infrastructure using Terraform.

gcloud auth list
gcloud config list project

terraform

#Update Terraform

wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
unzip terraform_0.13.0_linux_amd64.zip 
sudo mv terraform /usr/local/bin/
terraform -v

#-------------------Build infrastructure

#create an empty configuration file named instance.tf
touch instance.tf

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

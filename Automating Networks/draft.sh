

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip

# Set the PATH environmental variable to Terraform binaries:
export PATH="$PATH:$HOME/terraform"
cd /usr/bin
sudo ln -s $HOME/terraform
cd $HOME
source ~/.bashrc

export GOOGLE_PROJECT=$(gcloud config get-value project)
mkdir tfnet
cd tfnet
nano provider.tf

#provider "google" {}
# Create 

# Rewrite the Terraform configurations files to a canonical format and style by running the following command:
terraform fmt
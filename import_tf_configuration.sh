###############################################################################################
# TARGET:  import an existing Docker container and image into an empty Terraform workspace
# import an existing Docker container and image into an empty Terraform workspace
###############################################################################################


#Problem statement: How to manage infrastructure that wasn’t created by Terraform.
# Resolution: Use Terraform Import

# Steps:
# 1. Identify the existing infrastructure to be imported.
# 2. Import the infrastructure into your Terraform state.
# 3. Write a Terraform configuration that matches that infrastructure.
# 4. Review the Terraform plan to ensure that the configuration matches the expected state and infrastructure.
# 5. Apply the configuration to update your Terraform state.




# Create a Docker contianer

docker run --name hashicorp-learn --detach --publish 8080:80 nginx:latest
docker ps

# Import the container into Terraform

git clone https://github.com/hashicorp/learn-terraform-import.git
cd learn-terraform-import

terraform init

    #comment out or delete the host argument
provider "docker" {
#   host    = "npipe:////.//pipe//docker_engine"
}


resource "docker_container" "web" {}

# Find the name of the container we want to import
docker ps


# Terraform import requires this Terraform resource ID and the full Docker container ID

terraform import docker_container.web $(docker inspect -f {{.ID}} hashicorp-learn)

terraform show


# CREATE CONFIGURATION

terraform plan

    # Terraform will show errors for the missing required arguments image and name.

# Copy Terraform STATE into the docker.tf file
terraform show -no-color > docker.tf

terraform plan



#  Remove all of these attributes, keeping only the required attributes: image, name, and ports.
resource "docker_container" "web" {
    image = "sha256:87a94228f133e2da99cb16d653cd1373c5b4e8689956386c1c12b60a20421a02"
    name  = "hashicorp-learn"
    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}



terraform plan
terraform apply


# CREATE IMAGE RESOURCE

    #To retrieve the image's tag name, run the following command, replacing <IMAGE-ID> with the image ID from docker.tf

docker image inspect <IMAGE-ID> -f {{.RepoTags}}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
}


terraform apply
# Change the image value for docker_container.web to reference the new image resource:
resource "docker_container" "web" {
    image = docker_image.nginx.latest
    name  = "hashicorp-learn"
    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# MANAGE THE CONTAINER with Terraform


resource "docker_container" "web" {
  name  = "hashicorp-learn"
  image = docker_image.nginx.latest
  ports {
    external = 8081
    internal = 80
    ip       = "0.0.0.0"
    protocol = "tcp"
  }
}


terraform apply

docker ps

# Destroy infrastructure
terraform destroy
docker ps --filter "name=hashicorp-learn"

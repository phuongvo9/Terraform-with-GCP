# the load balancing modules for Terraform
# Configure Terraform in the Google Cloud environment
# Create a global HTTPS Content-Based Load Balancer

terraform init
terraform plan -out=tfplan -var 'project=qwiklabs-gcp-00-012e3ba5a944'


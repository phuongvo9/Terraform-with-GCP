# the load balancing modules for Terraform
# Configure Terraform in the Google Cloud environment
# Create a global HTTPS Content-Based Load Balancer

terraform init

terraform validate
terraform plan -out=tfplan -var 'project=qwiklabs-gcp-00-012e3ba5a944'

EXTERNAL_IP=$(terraform output | grep load-balancer-ip | cut -d = -f2 | xargs echo -n)

echo https://${EXTERNAL_IP}
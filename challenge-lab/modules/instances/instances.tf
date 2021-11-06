# resource "google_compute_instance" "tf-instance-1" {
#   name = "tf-instance-1"
#   machine_type = "n1-standard-1"
#   zone = var.zone
#   boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-10"
#     }
#   }
#   network_interface {
#     network = "default"
#   }
#   metadata_startup_script = <<-EOT
#         #!/bin/bash
#     EOT
#   allow_stopping_for_update = true

# }
# resource "google_compute_instance" "tf-instance-2" {
#   name = "tf-instance-2"
#   machine_type = "n1-standard-1"
#   zone = var.zone
#   boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-10"
#     }
#   }
#   network_interface {
#     network = "default"
#   }
#   metadata_startup_script = <<-EOT
#         #!/bin/bash
#     EOT
#   allow_stopping_for_update = true
# }

### Task 4

resource "google_compute_instance" "tf-instance-1" {
  name = "tf-instance-1"
  
  # Task 4 - Change machine type
  machine_type = "n1-standard-2"
  zone = var.zone
  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true

}
resource "google_compute_instance" "tf-instance-2" {
  name = "tf-instance-2"
  
  # Change from n1-standard-1 to n1-standard-2
  machine_type = "n1-standard-2"
  zone = var.zone
  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

# Add 3rd instance
resource "google_compute_instance" "tf-instance-707450" {
  name = "tf-instance-2"
  
  # Change from n1-standard-1 to n1-standard-2
  machine_type = "n1-standard-2"
  zone = var.zone
  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
   allow_stopping_for_update = true
}
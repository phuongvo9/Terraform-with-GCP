resource "google_storage_bucket" "storage-bucket" {
  name          = "tf-bucket-550252"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    bucket = "gcs_backend_bucket" # TODO:bucket名を入れること
    prefix = "terraform/state"
  }
}

resource "google_artifact_registry_repository" "cloud_run_image" {
  location      = var.location
  repository_id = "${var.service_name}-${var.env}-docker-image"
  description   = "docker repository for ${var.env}"
  format        = "DOCKER"
}

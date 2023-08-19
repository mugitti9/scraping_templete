resource "google_cloud_run_service" "default" {
  name                       = "${var.service_name}-${var.env}"
  location                   = var.location
  autogenerate_revision_name = true

  metadata {
    annotations = {
      "run.googleapis.com/launch-stage" = "BETA"
    }
  }

  template {
    spec {
      containers {
        image = "${var.location}-docker.pkg.dev/${var.project_id}/${var.image_repository_name}/${var.image_name}"
      }
      service_account_name = google_service_account.cloud_run.email
    }
  }
  lifecycle {
    ignore_changes = [
      template[0].spec[0].containers[0].image
    ]
  }
}

resource "google_service_account" "cloud_run" {
  project      = var.project_id
  account_id   = "${var.env}-google-cloud-run"
  display_name = "Service Account for google cloud run in ${var.service_name} ${var.env}"
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

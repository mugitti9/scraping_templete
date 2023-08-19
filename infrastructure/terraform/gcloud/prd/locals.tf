locals {
  service_name = "service-name"    # TODO:service-nameを入れること
  env          = "prd"             # TODO:必要であればenvを変えること
  location     = "asia-northeast1" # TODO:必要であればlocationを変えること
  project_id   = "project_id"      # TODO:project_idをを変えること

  // Secret Managerは不要であれば消す(大抵必要そうだから入れている)
  services = toset([
    "iam.googleapis.com",
    "firestore.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "run.googleapis.com",
    "firebase.googleapis.com",
    "firestore.googleapis.com",
    "calendar-json.googleapis.com",
    "cloudscheduler.googleapis.com",
    "cloudbuild.googleapis.com"
  ])
}

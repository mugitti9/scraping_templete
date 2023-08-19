module "mic_practice_bot_cloud_run" {
  source = "../_modules/google_cloud_run_service"

  service_name = local.service_name
  project_id = local.project_id
  env = local.env
  location = local.location
  image_repository_name = module.cloud_run_image_artifact_registry.name
  image_name = "scraping_templete"
  depends_on = [ google_project_service.service ]
}

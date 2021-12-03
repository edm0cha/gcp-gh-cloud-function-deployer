module "video_captioning" {
  source      = "./modules/video-captioning-function"
  name_prefix = local.name_prefix
  project     = local.project
}

module "cloudbuild" {
  source      = "./modules/cloudbuild"
  project     = local.project
  name_prefix = local.name_prefix
}

module "video_captioning" {
  source      = "./modules/video-captioning-function"
  name_prefix = local.name_prefix
  project     = local.project
}

module "cloudbuild" {
  source                 = "./modules/cloudbuild"
  project                = local.project
  name_prefix            = local.name_prefix
  github_owner           = var.github_owner
  github_repository_name = var.github_repository_name
  bucket_url             = module.video_captioning.bucket_url
  function_name          = module.video_captioning.name
  depends_on = [
    module.video_captioning
  ]
}

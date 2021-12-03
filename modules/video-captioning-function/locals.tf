locals {
  name        = var.name_prefix
  description = "Calls google cloud function that create and uploads captions files to Etsyweb when new videos are uploaded"
  runtime     = "php74"

  timeout             = 360
  available_memory_mb = 256

  video_uploads_bucket = "video-caption-test-data"
}

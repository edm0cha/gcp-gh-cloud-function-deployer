locals {
  name        = var.name_prefix
  description = "Video Captioning Cloud Build Trigger"
  runtime     = "php74"

  timeout             = 360
  available_memory_mb = 256
}

data "google_storage_bucket" "video_uploads_bucket" {
  name = local.video_uploads_bucket
}

resource "google_cloudfunctions_function" "this" {
  name                = local.name
  description         = local.description
  runtime             = local.runtime
  timeout             = local.timeout
  available_memory_mb = local.available_memory_mb

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name

  entry_point = "handler"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = data.google_storage_bucket.video_uploads_bucket.name
  }

  environment_variables = {
  }
}

resource "google_storage_bucket" "bucket" {
  name     = local.name
  location = "US"
}

resource "google_storage_bucket_object" "archive" {
  name   = "dummy.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.module}/dummy.zip"
}

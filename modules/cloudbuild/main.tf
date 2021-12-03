resource "google_cloudbuild_trigger" "this" {
  name        = local.name
  description = local.description
  project     = var.project

  github {
    owner = var.github_owner
    name  = var.github_repository_name
    push {
      branch = "main"
    }
  }

  ignored_files = [
    "README.md"
  ]

  build {
    step {
      name       = "gcr.io/google.com/cloudsdktool/cloud-sdk"
      entrypoint = "bash"
      args = [
        "-c",
        <<-EOF
        apt-get install -y zip
        zip /tmp/$SHORT_SHA.zip index.php
        gsutil cp /tmp/$SHORT_SHA.zip ${var.bucket_url}/$SHORT_SHA.zip
        EOF
      ]
    }
  }
}

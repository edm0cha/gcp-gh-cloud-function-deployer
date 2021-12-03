resource "google_cloudbuild_trigger" "this" {
  name        = local.name
  description = local.description
  project     = var.project

  github {
    owner = "edm0cha"
    name  = "php-cloud-function"
    push {
      branch = "main"
    }
  }

  ignored_files = [
    "README.md"
  ]

  build {
    step {
      id         = "branch name"
      name       = "alpine"
      entrypoint = "sh"
      args       = ["-c", "echo main"]
    }
  }
}

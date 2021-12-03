terraform {
  backend "gcs" {
    bucket = "edwin-videos-development-tfstate"
  }
  required_version = "= 1.0.11"
}

data "terraform_remote_state" "organization" {
  backend = "gcs"
  config = {
    bucket = "edwin-videos-development-tfstate"
  }
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "owner" {
  description = "Engineer ldap"
  type        = string
}

variable "github_owner" {
  description = "Github Repository Owner Username"
  type        = string
}

variable "github_repository_name" {
  description = "Github Repository Name"
  type        = string
}

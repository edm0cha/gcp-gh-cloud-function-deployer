resource "google_service_account" "service_account" {
  account_id   = local.name
  display_name = local.name
}

resource "google_project_iam_member" "act_as" {
  project = var.project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "logs_writer" {
  project = var.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_custom_role" "function_role" {
  title       = local.name
  description = local.description
  role_id     = replace(local.name, "-", "_")
  permissions = [
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "storage.objects.list",
    "storage.objects.create"
  ]
}

resource "google_project_iam_member" "function_role" {
  project = var.project
  role    = google_project_iam_custom_role.function_role.id
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

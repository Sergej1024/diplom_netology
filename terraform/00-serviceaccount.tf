// Create SA
resource "yandex_iam_service_account" "bucket-diplom" {
  folder_id = var.YC_FOLDER_ID
  name      = "bucket-diplom"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "viewer" {
  folder_id = var.YC_FOLDER_ID
  role      = "viewer"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-diplom.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.YC_FOLDER_ID
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-diplom.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "bucket-diplom" {
  service_account_id = yandex_iam_service_account.bucket-diplom.id
  description        = "static access key for object storage"
}
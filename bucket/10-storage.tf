resource "yandex_storage_bucket" "bucket" {
  bucket     = "dimplom-bucket"
  access_key = yandex_iam_service_account_static_access_key.bucket-diplom.access_key
  secret_key = yandex_iam_service_account_static_access_key.bucket-diplom.secret_key

  anonymous_access_flags {
    read = false
    list = false
  }
}

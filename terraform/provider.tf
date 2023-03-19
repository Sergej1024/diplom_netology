terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.78.2"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "dimplom-bucket"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEOnx6k5N6Dv7qvECt_lRk"
    secret_key = "YCPymA5I_4xrVO-FUNVkcvj_LmSY-la0Vl3EkDWa"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.YC_ZONE
}

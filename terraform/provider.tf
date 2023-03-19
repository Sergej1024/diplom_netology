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
    access_key = "YCAJElgc4RvhrFxZ_DGh5-Anw"
    secret_key = "YCPwI3QdnlUwZ3oBPUxbhG22aJv3adWb9R6WO0JS"

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

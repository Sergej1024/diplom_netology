variable "YC_TOKEN" {
  default = "AQAAAAACfG8AAATuwfHJTfeY0kfqjb2D5fkWJfM"
}

variable "YC_CLOUD_ID" {
  default = "b1g3839rsq4g6pkhp2e7"
}


variable "YC_FOLDER_ID" {
  default = "b1gaa80uc55olksp2vtt"
}

variable "YC_ZONE" {
  default = "ru-central1-a"
}

variable "user_data" {
  default     = "meta.yml"
  description = "Cloud init for VM"
}

# DockerHub
variable "dockerhub_login" {
  default = "sergej1024"
}

variable "dockerhub_password" {
  default   = "A4uhj#zx12"
  sensitive = true
}

# GitHub
variable "github_personal_access_token" {
  default   = "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"
  sensitive = true
}

variable "github_webhook_secret" {
  default = "diplomsecret"
}

variable "github_login" {
  default = "Sergej1024"
}

variable "yc_access_key" {
  default = "YCAJEwQdANa_nagUkLZz6HmX8"
}

variable "yc_secret_key" {
  default = "YCO9N6WhuVCz0mCzRQRInrLR0IYq9gj4Cl1GdSA1"
}
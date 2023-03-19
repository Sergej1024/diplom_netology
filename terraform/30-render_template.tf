################################################################################
# Рендер ../01-yandex/provider.tf с ключами к бакету
# Чтобы не писать руками

# -------------------------------------------------
# Файл для импорта логина и пароля к аккаунту Докера
# в Jenkins Credentials
data "template_file" "provider" {
  template = file("${path.module}/templates/provider.tpl")

  vars = {
    access_key = yandex_iam_service_account_static_access_key.bucket-diplom.access_key
    secret_key = yandex_iam_service_account_static_access_key.bucket-diplom.secret_key
  }

  depends_on = [
    yandex_iam_service_account_static_access_key.bucket-diplom
  ]
}

# -------------------------------------------------
# Сохранение рендера креденшелов в файл
resource "null_resource" "provider" {

  provisioner "local-exec" {
    command = format("cat <<\"EOF\" > \"%s\"\n%s\nEOF", "../terraform/provider.tf", data.template_file.provider.rendered)
  }

  triggers = {
    template = data.template_file.provider.rendered
  }
}

resource "yandex_vpc_network" "dimplom" {
  name = "dimplom-${terraform.workspace}"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public-${terraform.workspace}"
  v4_cidr_blocks = ["10.86.10.0/24"]
  network_id     = yandex_vpc_network.dimplom.id
}

resource "yandex_vpc_subnet" "private" {
  name           = "private-${terraform.workspace}"
  v4_cidr_blocks = ["10.86.20.0/24"]
  network_id     = yandex_vpc_network.dimplom.id
  # route_table_id = yandex_vpc_route_table.private_to_public.id
}

# resource "yandex_vpc_route_table" "private_to_public" {
#   name       = "private_to_public-${terraform.workspace}"
#   network_id = yandex_vpc_network.dimplom.id
#   static_route {
#     destination_prefix = "0.0.0.0/0"
#     next_hop_address   = yandex_compute_instance.public_instance.network_interface.0.ip_address
#   }
# }

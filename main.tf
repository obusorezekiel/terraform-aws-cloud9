module "image" {
  source = "./image"
  for_each = local.deployment
  image_in = each.value.image
}


module "container" {
  source = "./container"
  for_each = local.deployment
  count_in = each.value.container_count
  name_in  = each.key
  image_in = module.image[each.key].image_out
  int_port_in = each.value.int
  ext_port_in = each.value.ext[0]
  container_path_in = each.value.container_path
  #host_path_in = "${path.cwd}/noderedvol"
}


# output "IP-Address2"{
#   value = join(":", [docker_container.nodered_container[1].ip_address, docker_container.nodered_container[1].ports[0].external])
#   description = "The IP address of the container"
# }




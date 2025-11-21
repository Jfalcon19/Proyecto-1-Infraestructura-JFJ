output "server1" {
  value = {
    nombre = "server1"
    ip     = try(libvirt_domain.server1.network_interface[0].addresses[0], "No disponible")
  }
}

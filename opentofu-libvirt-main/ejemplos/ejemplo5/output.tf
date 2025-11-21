output "server1" {
  value = {
    nombre = "server1"
    ip1    = try(libvirt_domain.server1.network_interface[0].addresses[0], "No disponible")
    ip2    = try(libvirt_domain.server1.network_interface[1].addresses[0], "No disponible")
  }
}

output "server2" {
  value = {
    nombre = "server2"
    ip1    = try(libvirt_domain.server2.network_interface[0].addresses[0], "No disponible")
  }
}

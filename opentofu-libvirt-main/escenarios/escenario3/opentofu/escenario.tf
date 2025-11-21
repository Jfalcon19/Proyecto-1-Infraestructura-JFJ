##############################################
# escenario.tf — Escenario proxy + backend
##############################################

locals {

  ##############################################
  # Redes a crear
  ##############################################

  networks = {
    red-externa-pry1 = {
      name      = "red-externa-pry1"
      mode      = "nat"
      domain    = "example.com"
      addresses = ["192.168.200.0/24"]
      bridge    = "br-ex-pry1"
      dhcp      = true
      dns       = true
      autostart = true
    }

    red-conf-pry1 = {
      name      = "red-conf-pry1"
      mode      = "none" # sin conectividad
      addresses = ["192.168.201.0/24"]
      bridge    = "br-conf-pry1"
      autostart = true
    }

    red-datos-pry1 = {
      name      = "red-datos-pry1"
      mode      = "none" # sin conectividad
      bridge    = "br-datos-pry1"
      autostart = true
    }
  }

  ##############################################
  # Máquinas virtuales a crear
  ##############################################

  servers = {
    apache2 = {
      name       = "apache2-pry1"
      memory     = 1024
      vcpu       = 1
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "red-externa-pry1", wait_for_lease = true },
        { network_name = "red-conf-pry1" },
        { network_name = "red-datos-pry1" }
      ]

      user_data      = "${path.module}/cloud-init/server1/user-data.yaml"
      network_config = "${path.module}/cloud-init/server1/network-config.yaml"
    }

    mariadb = {
      name       = "mariadb-pry1"
      memory     = 1024
      vcpu       = 1
      base_image = "ubuntu2404-base.qcow2"

      networks = [
        { network_name = "red-externa-pry1", wait_for_lease = true },
        { network_name = "red-conf-pry1" },
        { network_name = "red-datos-pry1" }
      ]

      user_data      = "${path.module}/cloud-init/server2/user-data.yaml"
      network_config = "${path.module}/cloud-init/server2/network-config.yaml"
    }
  }
}

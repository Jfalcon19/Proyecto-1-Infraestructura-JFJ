variable "name" {
  description = "Nombre de la máquina virtual"
  type        = string
}

variable "memory" {
  description = "Memoria RAM en MB"
  type        = number
  default     = 1024
}

variable "vcpu" {
  description = "Número de CPUs virtuales"
  type        = number
  default     = 1
}

variable "pool_name" {
  description = "Nombre del pool de almacenamiento libvirt"
  type        = string
}

variable "pool_path" {
  description = "Ruta del pool de almacenamiento libvirt"
  type        = string
}

variable "base_image" {
  description = "Ruta o nombre del volumen base (imagen QCOW2 base)"
  type        = string
}

variable "disks" {
  description = "Lista de discos adicionales"
  type = list(object({
    name = string
    size = optional(number)
  }))
  default = []
}

variable "networks" {
  description = "Lista de redes asociadas a la VM, con sus IDs"
  type = list(object({
    network_id     = string
    wait_for_lease = optional(bool)
  }))
}


variable "user_data" {
  description = "Ruta al archivo user-data.yaml"
  type        = string
  default     = null
}

variable "network_config" {
  description = "Ruta al archivo network-config.yaml (opcional)"
  type        = string
  default     = null
}


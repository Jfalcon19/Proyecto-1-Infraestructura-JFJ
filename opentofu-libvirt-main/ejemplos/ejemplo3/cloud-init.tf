locals {
  base   = yamldecode(file("${path.module}/cloud-init/base.yaml"))
  user   = yamldecode(file("${path.module}/cloud-init/server1/user-data.yaml"))
  merged = merge(local.base, local.user)
}
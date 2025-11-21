locals {
  base    = yamldecode(file("${path.module}/cloud-init/base.yaml"))
  user1   = yamldecode(file("${path.module}/cloud-init/server1/user-data.yaml"))
  merged1 = merge(local.base, local.user1)
  user2   = yamldecode(file("${path.module}/cloud-init/server2/user-data.yaml"))
  merged2 = merge(local.base, local.user2)
}
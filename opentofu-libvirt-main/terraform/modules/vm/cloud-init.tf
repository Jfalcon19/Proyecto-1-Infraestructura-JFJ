locals {
  base   = yamldecode(file("${path.module}/base.yaml"))
  user = try(yamldecode(file(var.user_data)), {})
  merged = merge(local.base, local.user)
}
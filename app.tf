terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_image" "ubuntu" {
  slug = "ubuntu-20-04-x64"
}

module "key_pair" {
  source   = "./modules/key_pair"
  key_path = var.key_path
}

module "db1000n" {
  source = "./modules/droplet"

  for_each = toset([for i in range(var.db1000n_count) : tostring(i)])

  image       = data.digitalocean_image.ubuntu.id
  region      = var.regions[each.key]
  size        = var.droplet_size
  user_data   = templatefile("${path.cwd}/bootstraps/db1000n.tftpl", {})
  key_pair_id = module.key_pair.key_pair_id
}

module "mhddos_proxy" {
  source = "./modules/droplet"

  for_each = toset([for i in range(var.mhddos_proxy_count) : tostring(i)])

  image       = data.digitalocean_image.ubuntu.id
  key_pair_id = module.key_pair.key_pair_id
  region      = var.regions[each.key]
  size        = var.droplet_size
  user_data   = templatefile("${path.cwd}/bootstraps/proxy.tftpl", {
    targets : join(" ", var.mhddos_proxy_targets)
    threads : var.proxy_threads_count
  })
}

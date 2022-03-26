terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


resource "digitalocean_droplet" "instance" {
  image      = var.image
  name       = "ubuntu"
  region     = var.region
  size       = var.size
  ssh_keys   = [var.key_pair_id]
  user_data  = var.user_data
  monitoring = true
}

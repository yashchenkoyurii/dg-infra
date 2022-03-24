terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_ssh_key" "pub_key" {
  name       = "pub_key"
  public_key = file(var.key_path)
}

output "public_ip" {
  value = digitalocean_droplet.instance.ipv4_address
}

output "key_pair_id" {
  value = digitalocean_ssh_key.pub_key.fingerprint
}

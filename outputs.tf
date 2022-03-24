output "db1000n_ssh" {
  value = [
    for ip in values(module.db1000n)[*].public_ip : format(
      "ssh -i %s %s@%s", replace(var.key_path, ".pub", ""), var.instance_user, ip
    )
  ]
}

output "mhddos_proxy_ssh" {
  value = [
    for ip in values(module.mhddos_proxy)[*].public_ip : format(
      "ssh -i %s %s@%s", replace(var.key_path, ".pub", ""), var.instance_user, ip
    )
  ]
}

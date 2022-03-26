variable "do_token" {
  type        = string
  description = "Token for API operations"
}

variable "region" {
  type        = string
  description = "Set of regions for droplet"
  default     = "NYC1"
}

variable "key_path" {
  type        = string
  description = "Public key for login via SSH"
}

variable "instance_user" {
  default     = "root"
  description = "User for ssh connecting in yours OS image"
}

variable "db1000n_count" {
  type        = number
  description = "Instance count"
  default     = 2
}

variable "mhddos_proxy_targets" {
  type        = list(string)
  description = "Targets"
}

variable "mhddos_proxy_count" {
  type        = number
  description = "Instance count"
}

variable "droplet_size" {
  type = string
}

variable "regions" {
  type = list(string)
  description = "Regions where droplets are created"
}

variable "proxy_threads_count" {
  type = number
  description = "Number of threads in proxy"
}

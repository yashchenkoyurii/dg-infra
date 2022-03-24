variable "image" {
  type = string
  description = "Instance image"
}

variable "region" {
  type = string
  description = "Instance region"
}

variable "size" {
  type = string
  description = "Droplet size"
}

variable "key_pair_id" {
  type = string
  description = "SSH key pair ID"
}

variable "user_data" {
  type = string
  description = "Script to bootstrap instance"
}

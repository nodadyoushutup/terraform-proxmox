variable "endpoint" {
  type        = string
  description = "Proxmox API endpoint, e.g. https://192.168.1.10:8006/"
  validation {
    condition     = can(regex("^https?://", var.endpoint))
    error_message = "endpoint must start with http:// or https://."
  }
}

variable "username" {
  type        = string
  description = "Proxmox API username (e.g., root@pam)."
}

variable "password" {
  type        = string
  description = "Proxmox API password."
  sensitive   = true
}

variable "insecure" {
  type        = bool
  description = "Skip TLS verification for Proxmox API."
  default     = false
}

variable "ssh" {
  description = "SSH connection settings for the provider."
  type = object({
    agent    = bool
    username = string
    password = string
  })
  sensitive = true
}

variable "cloud_init" {
  description = "Cloud init definitions."
  type = any
}

variable "virtual_machine" {
  description = "List of VM definitions."
  type = any
}

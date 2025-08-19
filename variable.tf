variable "provider_config" {
  description = "Proxmox provider configuration"
  type = object({
    endpoint = string
    username = string
    password = string
    insecure = optional(bool, false)
    ssh = object({
      agent    = optional(bool, false)
      username = string
      password = string
    })
  })
  validation {
    condition = can(regex("^https?://", var.provider_config.endpoint))
    error_message = "provider_config.endpoint must start with http:// or https://."
  }
  sensitive = true
}
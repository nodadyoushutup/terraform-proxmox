terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.82.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.provider_config.endpoint
  username = var.provider_config.username
  password = var.provider_config.password
  insecure = var.provider_config.insecure

  ssh {
    agent    = var.provider_config.ssh.agent
    username = var.provider_config.ssh.username
    password = var.provider_config.ssh.password
  }
}
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.82.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password
  insecure = var.insecure

  ssh {
    agent    = var.ssh.agent
    username = var.ssh.username
    password = var.ssh.password
  }
}
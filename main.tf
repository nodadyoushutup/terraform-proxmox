# IMAGE
resource "proxmox_virtual_environment_download_file" "image" {
  for_each            = { for img in var.image : img.file_name => img }
  content_type        = each.value.content_type
  datastore_id        = each.value.datastore_id
  file_name           = each.value.file_name
  node_name           = each.value.node_name
  overwrite           = each.value.overwrite
  overwrite_unmanaged = each.value.overwrite_unmanaged
  url                 = each.value.url
}

resource "proxmox_virtual_environment_file" "user_cloud_config" {
  for_each     = { for cloud_init in var.cloud_init : cloud_init.file_name => cloud_init }
  content_type = each.value.content_type
  datastore_id = each.value.datastore_id
  node_name    = each.value.node_name
  overwrite    = each.value.overwrite
  source_raw {
    data      = "#cloud-config\n${yamlencode(each.value.config)}"
    file_name = each.value.file_name
  }
}

resource "proxmox_virtual_environment_vm" "virtual_machine" {
  for_each = { for vm in var.virtual_machine : vm.vm_id => vm }

  name      = each.value.name
  node_name = each.value.node_name
  vm_id     = each.value.vm_id
  bios      = each.value.bios

  agent {
    enabled = each.value.agent.enabled
  }

  cpu {
    cores = each.value.cpu.cores
  }

  memory {
    dedicated = each.value.memory.dedicated
  }

  disk {
    datastore_id = each.value.disk.datastore_id
    interface    = each.value.disk.interface
    iothread     = each.value.disk.iothread
    discard      = each.value.disk.discard
    size         = each.value.disk.size
    file_id      = each.value.disk.file_id
  }

  initialization {
    ip_config {
      ipv4 {
        address = each.value.initialization.ip_config.ipv4.address
        gateway = each.value.initialization.ip_config.ipv4.gateway
      }
    }
    user_data_file_id = each.value.initialization.user_data_file_id
  }

  network_device {
    bridge = each.value.network_device.bridge
  }

  depends_on = [
    proxmox_virtual_environment_download_file.image,
    proxmox_virtual_environment_file.user_cloud_config,
  ]
}


output "debug" {
  value = yamlencode(var.cloud_init[0].config)
}
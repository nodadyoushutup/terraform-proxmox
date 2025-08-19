# IMAGE
resource "proxmox_virtual_environment_download_file" "ndysu_jammy_cloud_image_amd64" {
  content_type = "iso"
  datastore_id = "eapp"
  file_name = "ndysu-jammy-cloud-image-amd64.img"
  node_name = "pve"
  overwrite = true
  overwrite_unmanaged = true
  url = "https://cir.nodadyoushutup.com/public/jammy-cloud-image-amd64-0.1.98.img"
}

resource "proxmox_virtual_environment_download_file" "ndysu_talos_cloud_image_amd64" {
  content_type = "iso"
  datastore_id = "eapp"
  file_name = "ndysu-talos-cloud-image-amd64.img"
  node_name = "pve"
  overwrite = true
  overwrite_unmanaged = true
  url = "https://github.com/nodadyoushutup/talos-image/releases/download/0.1.0/talos-image-amd64-0.1.0.img"
}

# CLOUD CONFIG
resource "proxmox_virtual_environment_file" "monitoring_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.monitoring)}"
    file_name = "monitoring_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_cp_0_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_cp_0)}"
    file_name = "talos_cp_0_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_cp_1_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_cp_1)}"
    file_name = "talos_cp_1_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_cp_2_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_cp_2)}"
    file_name = "talos_cp_2_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_wk_0_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_wk_0)}"
    file_name = "talos_wk_0_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_wk_1_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_wk_1)}"
    file_name = "talos_wk_1_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_wk_2_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_wk_2)}"
    file_name = "talos_wk_2_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_wk_3_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_wk_3)}"
    file_name = "talos_wk_3_cloud_config.yaml"
  }
}

resource "proxmox_virtual_environment_file" "talos_wk_4_cloud_config" {
  content_type = "snippets"
  datastore_id = "eapp"
  node_name = "pve"
  overwrite = true
  source_raw {
    data = "#cloud-config\n${yamlencode(local.cloud_init.talos_wk_4)}"
    file_name = "talos_wk_4_cloud_config.yaml"
  }
}




# VIRTUAL MACHINE
resource "proxmox_virtual_environment_vm" "monitoring_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_jammy_cloud_image_amd64,
    proxmox_virtual_environment_file.monitoring_cloud_config,
  ]

  name = "monitoring"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 50
    file_id = "eapp:iso/ndysu-jammy-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.105/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/monitoring_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  vm_id = 1105
}

resource "proxmox_virtual_environment_vm" "talos_cp_0_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_cp_0_cloud_config,
  ]

  name = "talos-cp-0"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.201/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_cp_0_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "controlplane"]
  vm_id = 1201
}

resource "proxmox_virtual_environment_vm" "talos_cp_1_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_cp_1_cloud_config,
  ]

  name = "talos-cp-1"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.202/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_cp_1_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "controlplane"]
  vm_id = 1202
}

resource "proxmox_virtual_environment_vm" "talos_cp_2_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_cp_2_cloud_config,
  ]

  name = "talos-cp-2"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.203/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_cp_2_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "controlplane"]
  vm_id = 1203
}

resource "proxmox_virtual_environment_vm" "talos_wk_0_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_wk_0_cloud_config,
  ]

  name = "talos-wk-0"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.204/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_wk_0_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "worker"]
  vm_id = 1204
}

resource "proxmox_virtual_environment_vm" "talos_wk_1_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_wk_1_cloud_config,
  ]

  name = "talos-wk-1"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.205/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_wk_1_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "worker"]
  vm_id = 1205
}

resource "proxmox_virtual_environment_vm" "talos_wk_2_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_wk_2_cloud_config,
  ]

  name = "talos-wk-2"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.206/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_wk_2_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "worker"]
  vm_id = 1206
}

resource "proxmox_virtual_environment_vm" "talos_wk_3_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_wk_3_cloud_config,
  ]

  name = "talos-wk-3"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.207/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_wk_3_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "worker"]
  vm_id = 1207
}

resource "proxmox_virtual_environment_vm" "talos_wk_4_virtual_machine" {
  depends_on = [
    proxmox_virtual_environment_download_file.ndysu_talos_cloud_image_amd64,
    proxmox_virtual_environment_file.talos_wk_4_cloud_config,
  ]

  name = "talos-wk-4"
  node_name = "pve"
  agent {
    enabled = true
  }
  bios = "seabios"
  cpu {
    cores = 2
    type = "host"
  }
  memory {
    dedicated = 4096
  }
  
  disk {
    datastore_id = "virtualization"
    interface = "virtio0"
    iothread = true
    discard = "on"
    size = 20
    file_id = "eapp:iso/ndysu-talos-cloud-image-amd64.img"
  }
  initialization {
    datastore_id = "virtualization"
    ip_config {
      ipv4 {
        address = "192.168.1.208/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = "eapp:snippets/talos_wk_4_cloud_config.yaml"
  }
  network_device {
    bridge = "vmbr0"
  }
  tags = ["talos", "worker"]
  vm_id = 1208
}
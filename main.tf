# # IMAGE
# resource "proxmox_virtual_environment_download_file" "jammy_cloud_image_amd64_0_1_98" {
#     content_type = "iso"
#     datastore_id = "local"
#     file_name = "jammy-cloud-image-amd64-0.1.98.img"
#     node_name = "pve"
#     overwrite = true
#     overwrite_unmanaged = true
#     url = "https://cir.nodadyoushutup.com/public/jammy-cloud-image-amd64-0.1.98.img"
# }

# resource "proxmox_virtual_environment_file" "debug_user_cloud_config" {
#     content_type = "snippets"
#     datastore_id = "local"
#     node_name = "pve"
#     overwrite = true
#     source_raw {
#         data = templatefile("${path.module}/cloud_init/debug_user_cloud_config.yaml", {
#             password = var.password
#         })
#         file_name = "debug_user_cloud_config.yaml"
#     }
# }

# resource "proxmox_virtual_environment_vm" "virtual_machine" {
#   for_each = { for vm in var.virtual_machine : vm.vm_id => vm }

#   name = each.value.name
#   node_name = each.value.node_name
#   vm_id = each.value.vm_id
#   bios = each.value.bios

#   agent {
#     enabled = each.value.agent.enabled
#   }

#   cpu {
#     cores = each.value.cpu.cores
#   }

#   memory {
#     dedicated = each.value.memory.dedicated
#   }

#   disk {
#     datastore_id = each.value.disk.datastore_id
#     interface = each.value.disk.interface
#     iothread = each.value.disk.iothread
#     discard = each.value.disk.discard
#     size = each.value.disk.size
#     file_id = each.value.disk.file_id
#   }

#   initialization {
#     ip_config {
#       ipv4 {
#         address = each.value.initialization.ip_config.ipv4.address
#         gateway = each.value.initialization.ip_config.ipv4.gateway
#       }
#     }
#     user_data_file_id = each.value.initialization.user_data_file_id
#   }

#   network_device {
#     bridge = each.value.network_device.bridge
#   }

#   depends_on = [
#     proxmox_virtual_environment_download_file.jammy_cloud_image_amd64_0_1_98,
#     proxmox_virtual_environment_file.debug_user_cloud_config,
#   ]
# }


output "debug" {
    value = yamlencode(var.cloud_init.user)
}
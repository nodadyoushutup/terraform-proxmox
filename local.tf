locals {
    gitconfig = {
        user = {
            name = "nodadyoushutup"
            email = "admin@nodadyoushutup.com"
        }
        pull = {
            rebase = "true"
        }
    }
    cloud_init = {
        database = {   
            hostname = "database"
            timezone = "America/New_York"
            mounts = [
                ["192.168.1.100:/mnt/epool/media", "/mnt/epool/media", "nfs", "defaults,_netdev", "0", "0"]
            ]
            groups = [
                "docker"
            ]
            users = [
                {
                    name = "default"
                },
                {
                    name = "nodadyoushutup"
                    groups = ["sudo", "docker"]
                    shell = "/bin/bash"
                    sudo = "ALL=(ALL) NOPASSWD:ALL"
                    lock_passwd = false
                    ssh_import_id = [
                        "gh:nodadyoushutup"
                    ]
                    ssh_authorized_keys = []
                }
            ]
            package_update = true
            package_upgrade = false
            packages = []
            write_files = [
                {
                    encoding = "b64"
                    content = base64encode(local.template.gitconfig)
                    owner = "root:root"
                    path = "/etc/skel/.gitconfig"
                    permissions = "0644"
                }
            ]
            bootcmd = [
                "mkdir -p /mnt/epool/media"
            ]
            runcmd = [
                "echo 'done' > /tmp/cloud-config.done"
            ]
        }
        monitoring = {   
            hostname = "monitoring"
            timezone = "America/New_York"
            mounts = [
                ["192.168.1.100:/mnt/epool/media", "/mnt/epool/media", "nfs", "defaults,_netdev", "0", "0"]
            ]
            groups = [
                "docker"
            ]
            users = [
                {
                    name = "default"
                },
                {
                    name = "nodadyoushutup"
                    groups = ["sudo", "docker"]
                    shell = "/bin/bash"
                    sudo = "ALL=(ALL) NOPASSWD:ALL"
                    lock_passwd = false
                    ssh_import_id = [
                        "gh:nodadyoushutup"
                    ]
                    ssh_authorized_keys = []
                }
            ]
            package_update = true
            package_upgrade = false
            packages = []
            write_files = [
                {
                    encoding = "b64"
                    content = base64encode(local.template.gitconfig)
                    owner = "root:root"
                    path = "/etc/skel/.gitconfig"
                    permissions = "0644"
                }
            ]
            bootcmd = [
                "mkdir -p /mnt/epool/media"
            ]
            runcmd = [
                "echo 'done' > /tmp/cloud-config.done"
            ]
        }
        cicd = {   
            hostname = "cicd"
            timezone = "America/New_York"
            mounts = [
                ["192.168.1.100:/mnt/epool/media", "/mnt/epool/media", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/home/.ssh", "/home/nodadyoushutup/.ssh", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/home/.kube", "/home/nodadyoushutup/.kube", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/home/.tfvars", "/home/nodadyoushutup/.tfvars", "nfs", "defaults,_netdev", "0", "0"]
            ]
            groups = [
                "docker"
            ]
            users = [
                {
                    name = "default"
                },
                {
                    name = "nodadyoushutup"
                    groups = ["sudo", "docker"]
                    shell = "/bin/bash"
                    sudo = "ALL=(ALL) NOPASSWD:ALL"
                    lock_passwd = false
                    ssh_import_id = [
                        "gh:nodadyoushutup"
                    ]
                    ssh_authorized_keys = []
                }
            ]
            package_update = true
            package_upgrade = false
            packages = []
            write_files = [
                {
                    encoding = "b64"
                    content = base64encode(local.template.gitconfig)
                    owner = "root:root"
                    path = "/etc/skel/.gitconfig"
                    permissions = "0644"
                }
            ]
            bootcmd = [
                "mkdir -p /mnt/epool/media",
                "mkdir -p /etc/skel/.ssh",
                "mkdir -p /etc/skel/.kube",
                "mkdir -p /etc/skel/.tfvars",
            ]
            runcmd = [
                "echo 'done' > /tmp/cloud-config.done"
            ]
        }
        talos_cp_0 = {   
            hostname = "talos-cp-0"
            timezone = "America/New_York"
        }
        talos_cp_1 = {   
            hostname = "talos-cp-1"
            timezone = "America/New_York"
        }
        talos_cp_2 = {   
            hostname = "talos-cp-2"
            timezone = "America/New_York"
        }
        talos_wk_0 = {   
            hostname = "talos-wk-0"
            timezone = "America/New_York"
        }
        talos_wk_1 = {   
            hostname = "talos-wk-1"
            timezone = "America/New_York"
        }
        talos_wk_2 = {   
            hostname = "talos-wk-2"
            timezone = "America/New_York"
        }
        talos_wk_3 = {   
            hostname = "talos-wk-3"
            timezone = "America/New_York"
        }
        talos_wk_4 = {   
            hostname = "talos-wk-4"
            timezone = "America/New_York"
        }
    }
    template = {
        gitconfig = templatefile("${path.module}/template/.gitconfig.tpl", {
            gitconfig = local.gitconfig
        })
    }
}


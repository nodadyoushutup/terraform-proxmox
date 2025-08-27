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
                ["192.168.1.100:/mnt/eapp/code", "/mnt/eapp/code", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.ssh", "/mnt/eapp/skel/.ssh", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.kube", "/mnt/eapp/skel/.kube", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.tfvars", "/mnt/eapp/skel/.tfvars", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.tfvars", "/mnt/eapp/skel/.tfvars", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.home", "/mnt/eapp/skel/.home", "nfs", "defaults,_netdev", "0", "0"],
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
                    uid = 1000
                    gid = 1000
                    sudo = "ALL=(ALL) NOPASSWD:ALL"
                    plain_text_passwd = "password"
                    lock_passwd = false
                    ssh_import_id = [
                        "gh:nodadyoushutup"
                    ]
                    ssh_authorized_keys = [
                        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCq6CJR8FeZ3C73GgeK0oZntTb5ufosNfyO5qooiUYNsNlnaniGSXN6g9iLEx0ctzU+TpJ3tMiBuPi1T+jr03EcSgm7gedPSufNidjCeEy2XadCBWamIYub0kdPeC1xWVBjTS46wIf17Nyc6OvingxpiR7NbdytvjaHm3nY77HPJWgGr/g6JoCinryLRSjVNV/OtWQIFWvu3I0NBs1aATfF/lT8bJBPcxJOTOFoc5zfOqaY/5KYdWQ5pUoIY0T3EDm6qkh2VW1e1eP/jdJIizLDU/zFLYE8GCyLwrH02gkzVs3Ve0gLz3R08ETH7Y1MuEq6nRz5TieRAmMXeUwVo+RP9i1Am3oWF498N3gQTthl/eEMn0DpOglO45/VwYivIsB77bpQj9JF4ALH3CqwzKfFqAsHFop+b4A27wNLyWe1BRhFhe4q2C60qW9iTfxR54nPl7mNKvtBP3zxXu0nMc2SdBlGfpcmSMit8f0R7j/3+snpu/Wsfo7bDhH+dYP7/c= nodadyoushutup@universal"
                    ]
                }
            ]
            package_update = true
            package_upgrade = false
            packages = []
            write_files = []
            bootcmd = [
                "rm -rf /etc/skel/.ssh",
                "ln -s /mnt/eapp/code /etc/skel/code",
                "ln -s /mnt/epool/media /etc/skel/media",
                "ln -s /mnt/eapp/skel/.ssh /etc/skel/.ssh",
                "ln -s /mnt/eapp/skel/.kube /etc/skel/.kube",
                "ln -s /mnt/eapp/skel/.tfvars /etc/skel/.tfvars",
                "ln -s /mnt/eapp/skel/.home/.gitconfig /etc/skel/.gitconfig",
            ]
            runcmd = [
                "echo 'done' > /tmp/cloud-config.done"
            ]
        }
        talos_cp_0 = {   
            hostname = "talos-cp-0"
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


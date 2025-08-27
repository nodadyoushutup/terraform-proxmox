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
                ["192.168.1.100:/mnt/eapp/skel/.home", "/mnt/eapp/skel/.home", "nfs", "defaults,_netdev", "0", "0"],
                ["192.168.1.100:/mnt/eapp/skel/.jenkins", "/mnt/eapp/skel/.jenkins", "nfs", "defaults,_netdev", "0", "0"],
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
                    ssh_import_id = []
                    ssh_authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDv17Wmq4Haegs0uvWNs+WdXhTXfrQiju/Y/+kC9mO70RPE3RH7VQ+swqIJmgfHPGX493OXUIfVoDOAuAq7LW5BAGdRggKpaQLowymUgN9oogLOCUcmZQTr3QuZdv+1A2dAqtDV6acus6tIWXsWfTQZYW3wn2JdeHIT0CmMg8YVWVuK4mMFwcEpwxVtHzEN7YYMHQcJ2rQElmlAcDPBJAM/F0wVinnzrEVwEcRbT9IrAV+6n0ef/N3wW6k/Qz89jd1znbjG8YBdmqlpApEdgWO8IpkifN2vmSb3Puu57v8DdUySeubVpFOXFfA1vjvdcVRDNXkjQ78EOYlnDFoUkiy0LpDwDFIAlps3ZX1R4m28xwdkasy8ZFqhEZ2xqh1raYlZmFXsH76GscbNsVovEKoQOg60jiotRqbCa+eh0iPEo+HYp7qETwLE41Ko+SWHpMHUMWa5asmwH9L3lOsCzUM+Y9icULct65BS0tYiKBvx4phANWleZQgG0QC8UJ5pZs= jacob@Desktop"]
                }
            ]
            package_update = true
            package_upgrade = false
            packages = []
            write_files = []
            bootcmd = [
                "ln -s /mnt/eapp/skel/.tfvars /etc/skel/.tfvars",
                "ln -s /mnt/eapp/skel/.kube /etc/skel/.kube",
                "ln -s /mnt/eapp/skel/.jenkins /etc/skel/.jenkins",
                "ln -s /mnt/eapp/skel/.home/.gitconfig /etc/skel/.gitconfig",
                "ln -s /mnt/eapp/code /etc/skel/code",
                "ln -s /mnt/eapp/media /etc/skel/media",
            ]
            runcmd = [
                "cp -a /mnt/eapp/skel/.ssh/id_rsa /home/nodadyoushutup/.ssh/id_rsa",
                "cp -a /mnt/eapp/skel/.ssh/id_rsa.pub /home/nodadyoushutup/.ssh/id_rsa.pub",
                "cp -a /mnt/eapp/skel/.ssh/authorized_keys /home/nodadyoushutup/.ssh/authorized_keys",
                "cp -a /mnt/eapp/skel/.ssh/config /home/nodadyoushutup/.ssh/config",
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


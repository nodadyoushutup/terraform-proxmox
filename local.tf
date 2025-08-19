locals {
  cloud_init = [
    for ci in var.cloud_init :
    merge(ci, {
      config = merge(ci.config, {
        write_files = [
          for wf in lookup(ci.config, "write_files", []) :
          merge(
            { for k, v in wf : k => v if k != "template" },
            {
              content = base64encode(
                templatefile("${path.module}/template/${wf.template}", var.gitconfig)
              )
            }
          )
        ]
      })
    })
  ]
}
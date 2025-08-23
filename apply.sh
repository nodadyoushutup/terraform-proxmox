#!/bin/bash

terraform apply -var-file="$HOME/.tfvars/proxmox.tfvars" --auto-approve

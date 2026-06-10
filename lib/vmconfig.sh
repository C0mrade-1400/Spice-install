#!/bin/bash

configure_vm() {
    read -rp "Enter VM name: " VM_NAME

    echo "[*] Opening VM XML..."

    sudo virsh edit "$VM_NAME"

    echo
    echo "[!] Ensure the VM contains:"
    echo "    - machine='q35'"
    echo "    - <graphics type='spice'/>"
    echo "    - virtio video"
    echo
}

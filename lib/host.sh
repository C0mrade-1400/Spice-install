#!/bin/bash

setup_host() {
    echo "[*] Installing host packages..."

    sudo apt update

    sudo apt install -y \
        qemu-kvm \
        libvirt-daemon-system \
        libvirt-clients \
        virt-manager \
        virt-viewer \
        spice-client-gtk \
        bridge-utils

    echo "[*] Enabling libvirtd..."

    sudo systemctl enable --now libvirtd

    echo "[*] Adding user to libvirt/kvm groups..."

    sudo usermod -aG libvirt,kvm "$USER"

    echo
    echo "[+] Host setup complete."
    echo "[!] Re-login required for group changes."
}

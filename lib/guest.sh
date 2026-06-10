#!/bin/bash

setup_guest() {
    echo "[*] Installing guest SPICE tools..."

    sudo apt update

    sudo apt install -y \
        spice-vdagent \
        qemu-guest-agent

    echo "[*] Enabling guest agent..."

    sudo systemctl enable --now qemu-guest-agent

    echo
    echo "[+] Guest setup complete."
    echo "[!] Reboot the VM."
}

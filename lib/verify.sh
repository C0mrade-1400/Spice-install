#!/bin/bash

verify_setup() {
    echo "=========================="
    echo " Verifying KVM/SPICE"
    echo "=========================="

    echo
    echo "[*] Checking KVM modules..."
    lsmod | grep kvm || true

    echo
    echo "[*] Checking /dev/kvm..."
    ls -l /dev/kvm || true

    echo
    echo "[*] Checking libvirtd..."
    systemctl status libvirtd --no-pager

    echo
    echo "[*] Checking virtualization support..."
    egrep -c '(vmx|svm)' /proc/cpuinfo

    echo
    echo "[+] Verification complete."
}

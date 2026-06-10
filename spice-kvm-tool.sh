#!/bin/bash
set -e

# Resolve script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$SCRIPT_DIR/lib"

# Import modules
source "$LIB_DIR/utils.sh"
source "$LIB_DIR/host.sh"
source "$LIB_DIR/guest.sh"
source "$LIB_DIR/verify.sh"
source "$LIB_DIR/vmconfig.sh"

check_privileges

if [[ $# -eq 1 ]]; then
    case "$1" in
        host) setup_host ;;
        guest) setup_guest ;;
        verify) verify_setup ;;
        fixvm) configure_vm ;;
        *)
            echo "Usage: $0 [host|guest|verify|fixvm]"
            exit 1
            ;;
    esac
    exit 0
fi

# Interactive menu
while true; do
    clear

    echo "=========================="
    echo " SPICE + KVM Setup Tool"
    echo " THIS IS A REPO MADE BY C0mrade-1400 
    echo "=========================="
    echo "1) Setup Host"
    echo "2) Setup Guest VM"
    echo "3) Verify Setup"
    echo "4) Configure VM for SPICE"
    echo "5) Exit"
    echo

    read -rp "Choose an option [1-5]: " choice

    case "$choice" in
        1) setup_host ;;
        2) setup_guest ;;
        3) verify_setup ;;
        4) configure_vm ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice." ;;
    esac

    echo
    read -rp "Press Enter to continue..."
done

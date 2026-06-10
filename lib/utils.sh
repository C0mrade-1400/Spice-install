#!/bin/bash

check_privileges() {
    if [[ $EUID -eq 0 ]]; then
        echo "[!] Do not run this script as root."
        exit 1
    fi
}

# SPICE + KVM Tool

A modular Bash tool for setting up:

* KVM/QEMU virtualization
* SPICE integration
* Virt-manager dependencies
* Guest VM tools
* Verification utilities

Designed for Debian/Ubuntu/Linux Mint systems.

---

# Features

* Interactive terminal menu
* One-command host setup
* One-command guest setup
* SPICE auto-configuration guidance
* KVM verification checks
* Modular Bash structure
* CLI and interactive modes

---

# Requirements

Supported systems:

* Ubuntu
* Linux Mint
* Debian
* Debian Derivatives
* Untested on other linux distros

Recommended:

* CPU virtualization enabled in BIOS

  * Intel VT-x
  * AMD-V

---

# Repository Structure

```txt
spice-kvm-tool/
├── install.sh
├── spice-kvm-tool.sh
├── README.md
└── lib
    ├── utils.sh
    ├── host.sh
    ├── guest.sh
    ├── verify.sh
    └── vmconfig.sh
```

---
# Installation


## 1. Clone the Repository


### Option 1 — Curl Installer

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/spice-kvm-tool/main/install.sh)
```
### Option 2 — Git Clone

```bash
git clone https://github.com/YOUR_USERNAME/spice-kvm-tool.git
cd spice-kvm-tool
```

---

## 2. Make Scripts Executable

```bash
chmod +x spice-kvm-tool.sh
chmod +x install.sh
```

---

## 3. Run the Installer

```bash
./install.sh
```

---

# Usage

## Interactive Menu

```bash
./spice-kvm-tool.sh
```

Menu:

```txt
1) Setup Host
2) Setup Guest VM
3) Verify Setup
4) Configure VM for SPICE
5) Exit
```

---

# CLI Usage

## Setup Host

Installs:

* qemu-kvm
* libvirt
* virt-manager
* SPICE tools
* virtualization utilities

```bash
./spice-kvm-tool.sh host
```

---

## Setup Guest VM

Run INSIDE the VM.

Installs:

* spice-vdagent
* qemu-guest-agent

```bash
./spice-kvm-tool.sh guest
```

---

## Verify Setup

Checks:

* KVM modules
* /dev/kvm
* virtualization support
* libvirtd status

```bash
./spice-kvm-tool.sh verify
```

---

## Configure VM

Opens the VM XML editor.

```bash
./spice-kvm-tool.sh fixvm
```

Recommended settings:

```xml
<type arch='x86_64' machine='q35'>hvm</type>
```

```xml
<graphics type='spice'/>
```

```xml
<video>
  <model type='virtio'/>
</video>
```

---

# SPICE Features

After setup you get:

* Clipboard sharing
* Dynamic resolution resizing
* Better mouse integration
* Improved graphics performance
* QEMU guest agent support

---

# Reboot Requirements

After host setup:

* Log out and back in

After guest setup:

* Reboot the VM

---

# Troubleshooting

## Check Virtualization Support

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

* `vmx` = Intel
* `svm` = AMD

If you get `0`, virtualization is disabled in BIOS.

---

## Check KVM Modules

```bash
lsmod | grep kvm
```

---

## Check /dev/kvm

```bash
ls -l /dev/kvm
```

---

## Restart libvirtd

```bash
sudo systemctl restart libvirtd
```

---
## If these don't work then open an issue.

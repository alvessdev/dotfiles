#!/usr/bin/env bash
sudo systemctl disable --now libvirtd
sudo pacman -Rns qemu-full virt-manager virt-viewer dnsmasq vde2 openbsd-netcat libguestfs qemu-hw-usb-host

#!/bin/bash
sudo pacman -Sy
sudo pacman -S --needed qemu-full virt-manager virt-viewer dnsmasq vde2 openbsd-netcat iptables-nft libguestfs
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER

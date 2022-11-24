#!/usr/bin/env bash
source ./Exec.sh

function setup_root_passwd() {
  echo ">> Seting root password..."
  Exec sudo passwd;
  echo ">> Set root password done."
}

function setup_host_ip() {
  echo ">> Set your hostname: ";
  Exec read hostname;
  Exec "echo $hostname > /etc/hostname";
  Exec 'echo "127.0.0.1 localhost" > /etc/hosts';
  Exec 'echo "::1 localhost ip6-localhost ip6-loopback" >> /etc/hosts';
  Exec "echo" "'127.0.1.1 ${hostname}.localdomain ${hostname}'" ">> /etc/hosts";
  Exec 'echo "ff02::1 ip6-allnodes" >> /etc/hosts';
  Exec 'echo "ff02::2 ip6-allrouters" >> /etc/hosts';
}

function setup_grub() {
  echo ">> Setting grub..."
  Exec grub-install --targe=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux;
  Exec grub-mkconfig -o /boot/grub/grub.cfg;
  echo ">> Set grub done."
}

Exec setup_root_passwd;
Exec setup_host_ip;
Exec setup_grub;
#!/usr/bin/env bash

source public.sh

function _inside_chroot() {
  Exec grub-install --targe=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux;
  Exec grub-mkconfig -o /boot/grub/grub.cfg;
  Exec sudo passwd;
}

function bootstrap_work() {
  echo ">> Make sure you have connected to network, configured pacman mirrors, mounted filesystem.";
  echo ">> Input your mounted filesystem mount point: ";
  Exec "read -r ROOT_PATH"

  BASIC_SOFTWARES=(base base-devel linux linux-firmware pacman)
  NETWORK=(iwd dhcpcd)
  BOOT_LOADER=(grub efibootmgr os-prober)
  EDITOR=(vim)

  Exec "pacstrap ${ROOT_PATH} ${BASIC_SOFTWARES[*]} ${NETWORK[*]} ${BOOT_LOADER[*]} ${EDITOR[*]} ";
  Exec "cp /etc/pacman.d/mirrorlist ${ROOT_PATH}/etc/pacman.d/mirrorlist";
  Exec "genfstab -U ${ROOT_PATH} >> /mnt/etc/fstab";

  Exec arch-chroot ${ROOT_PATH};

  export -f Exec;
  export -f Invoke;
  export -f _inside_chroot;
  Exec chroot ${ROOT_PATH} /bin/bash -c "_inside_chroot";
}

Invoke bootstrap_work;

echo "You can reboot now.";
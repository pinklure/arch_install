#!/usr/bin/env bash

source ./Exec.sh

function bootstrap_work() {
  echo ">> Make sure you have connected to network, configured pacman mirrors, mounted filesystem.";
  echo ">> Input your mounted filesystem mount point: ";
  Exec "read -r ROOT_PATH"

  BASIC_SOFTWARES=(base base-devel linux linux-firmware pacman)
  NETWORK=(iwd dhcpcd)
  BOOT_LOADER=(grub efibootmgr os-prober)
  EDITOR=(vim)

  Exec "pacstrap ${ROOT_PATH} ${BASIC_SOFTWARES[*]} ${NETWORK[*]} ${BOOT_LOADER[*]} ${EDITOR[*]} "
  Exec "cp /etc/pacman.d/mirrorlist ${ROOT_PATH}/etc/pacman.d/mirrorlist"
  Exec "genfstab -U ${ROOT_PATH} >> /mnt/etc/fstab"
  Exec "arch-chroot ${ROOT_PATH}"
}


Exec bootstrap_work;
#!/usr/bin/env bash

source ./Exec.sh

function setup_network_daemons() {
  echo ">> Setting network daemons...";
  Exec systemctl enable iwd dhcpcd systemd-resolved
  Exec systemctl start iwd dhcpcd systemd-resolved
  echo ">> Set network daemons done.";
}

function setup_localization() {
  echo ">> Setting localization...";

  Exec "sed -i 's/^#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen"
  Exec "echo 'LANG=en_GB.UTF-8' > /etc/locale.conf"
  Exec locale-gen

  echo ">> Set localization done.";
}

function setup_timedate() {
  echo ">> Setting timedate...";

  Exec ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;
  Exec hwclock --systohc;
  Exec timedatectl set-timezone UTC;
  Exec timedatectl set-ntp true;

  echo ">> Set timedate done.";
}

function setup_archlinuxcn() {
  echo ">> Setting archlinuxcn...";

  Exec 'echo "[archlinuxcn]" >> /etc/pacman.conf';
  Exec 'echo "SigLevel = Never" >> /etc/pacman.conf';
  Exec 'echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf';
	Exec pacman -Sy;
  Exec pacman -S yay;

  echo ">> Set archlinuxcn done.";
}


Exec setup_network_daemons;
Exec setup_localization;
Exec setup_timedate;
Exec setup_archlinuxcn;

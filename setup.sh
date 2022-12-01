#!/usr/bin/env bash

source public.sh

function setup_network() {
  echo "Enter hostname:";
  Exec read hostname;
  Exec "echo $hostname > /etc/hostname";
  Exec 'echo "127.0.0.1 localhost" > /etc/hosts';
  Exec 'echo "::1 localhost ip6-localhost ip6-loopback" >> /etc/hosts';
  Exec "echo" "'127.0.1.1 ${hostname}.localdomain ${hostname}'" ">> /etc/hosts";
  Exec 'echo "ff02::1 ip6-allnodes" >> /etc/hosts';
  Exec 'echo "ff02::2 ip6-allrouters" >> /etc/hosts';

  Exec systemctl enable iwd dhcpcd systemd-resolved
  Exec systemctl start iwd dhcpcd systemd-resolved
}

function setup_localization() {
  Exec "sed -i 's/^#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen"
  Exec "echo 'LANG=en_GB.UTF-8' > /etc/locale.conf"
  Exec locale-gen
}

function setup_timedate() {
  Exec ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;
  Exec hwclock --systohc;
  Exec timedatectl set-timezone UTC;
  Exec timedatectl set-ntp true;
  Exec timedatectl set-timezone Asia/Shanghai
}

function setup_archlinuxcn() {
  Exec 'echo "[archlinuxcn]" >> /etc/pacman.conf';
  Exec 'echo "SigLevel = Never" >> /etc/pacman.conf';
  Exec 'echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf';
	Exec pacman -Sy;
  Exec pacman -S yay;
}

function setup_user() {
  echo ">> Please input new username:";
  Exec read username;
  Exec useradd $username;
  Exec passwd $username;
  home_path="/home/${username}";
  Exec cp -r ./user_home $home_path;
  Exec chown -R "${username}:${username}" ${home_path};
}

function setup_config_files() {
  Exec cp ./config_files /;
}


Invoke setup_network;
Invoke setup_localization;
Invoke setup_timedate;
Invoke setup_archlinuxcn;
Invoke setup_user;
Invoke setup_config_files;
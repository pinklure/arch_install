#!/usr/bin/env bash

source public.sh

function install() {
  eval "pacman -S --noconfirm $*"
}

# Command Line
Exec install mesa vulkan-intel xf86-video-intel;
Exec install bash-completion openssh ranger tmux;
Exec install powerline python-pdftotext highlight;
Exec install mlocate man-db man-pages;
Exec mandb # create man database
Exec install vim vim-plug;
Exec install ccls bash-language-server;
Exec install git gcc gdb clang cmake make bear llvm lldb;
Exec install linux-headers;
Exec install rust rust-analyzer;
Exec install python python-pip nodejs npm;
Exec install tar zip unzip unrar;
Exec install ntfs-3g fuse gvfs;
Exec install tree
Exec install bcc bcc-tools bpftrace sysstat perf

# Desktop
Exec install sway swayidle waybar wdisplays dunst;
Exec install alacritty
Exec install grim wl-clipboard clipman slurp;
Exec install thunar xarchiver gwenview mousepad zathura zathura-pdf-mupdf zathura-djvu;
Exec install alsa alsa-utils pavucontrol pulseaudio;
Exec install picom brightnessctl kanshi;
Exec install ttf-dejavu ttf-roboto noto-fonts nerd-fonts-complete;
Exec install wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei;
Exec install noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts;
Exec install qemu libvirt dmidecode dnsmasq bridge-utils

echo "Please install [swaylock-effects rofi-lbonn-wayland-only-git] by AUR, [cmake-language-server python-language-server] by Python3-pip";


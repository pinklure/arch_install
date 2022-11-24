#!/usr/bin/env bash

source ./Exec.sh


function install() {
  eval "pacman -S --noconfirm $*"
}

# Command Line
Exec install mesa vulkan-intel xf86-video-intel;
Exec install bash-completion openssh ranger tmux powerline python-pdftotext;
Exec install mlocate man-db man-pages;
Exec install vim ctags ccls vim-plug;
Exec install git gcc gdb clang cmake;
Exec install python python-pip nodejs npm;
Exec install tar zip unzip unrar;
Exec install ntfs-3g fuse gvfs;

# Desktop
Exec install sway swayidle swaylock waybar wdisplays;
Exec install wl-paste dunst ;
Exec install dmenu thunar xarchiver gwenview mousepad zathura zathura-pdf-mupdf zathura-djvu;
Exec install alsa alsa-utils pavucontrol pulseaudio;
Exec install picom brightnessctl kanshi;

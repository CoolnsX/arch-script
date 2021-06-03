#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose --protocol http,https --latest 10 -a 12 --sort rate --save /etc/pacman.d/mirrorlist

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies simplescreenrecorder vlc

yay -S --noconfirm google-chrome mugshot qogir-gtk-theme qogir-icon-theme auto-cpufreq timeshift timeshift-autosnap

sudo systemctl enable lightdm
sudo systemctl enable --now auto-cpufreq

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
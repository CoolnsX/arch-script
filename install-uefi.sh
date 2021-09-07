#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo "Please type root password"
passwd root

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --noconfirm --needed doas efibootmgr os-prober grub grub-btrfs networkmanager materia-gtk-theme papirus-icon-theme btrfs-progs dialog wpa_supplicant dosfstools reflector base-devel xdg-user-dirs xdg-utils gvfs-mtp bluez bluez-utils alsa-utils alsa-firmware alsa-lib alsa-oss alsa-plugins alsa-topology-conf alsa-ucm-conf pulseaudio pulseaudio-bluetooth bash-completion openssh git neovim
pacman -S --noconfirm --needed xf86-video-intel
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd

useradd -mG wheel tanveer
passwd tanveer

touch /etc/doas.conf
echo "permit nopass :wheel as root" >> /etc/doas.conf

echo "Enable users wheel in sudoers file"
sleep 5
EDITOR=nvim visudo

printf "\e[1;32mDone! Type exit, umount -a and reboot.If u installed system on btrfs FS... considering add btrfs in modules of mkinitcpio file and generate initcpio file\e[0m"





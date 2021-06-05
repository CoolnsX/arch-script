sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose --protocol http,https --latest 10 -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

#pikaur -S --noconfirm lightdm-slick-greeter 
#pikaur -S --noconfirm lightdm-settings
#pikaur -S --noconfirm polybar
#pikaur -S --noconfirm nerd-fonts-iosevka
#pikaur -S --noconfirm ttf-icomoon-feather

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm gnome-shell-extension-system76-power-git
yay -S --noconfirm auto-cpufreq
sudo systemctl enable --now auto-cpufreq

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm xorg light-locker lightdm bspwm sxhkd xfce4-terminal picom nitrogen lxappearance dmenu thunar simplescreenrecorder alsa-utils pulseaudio alsa-utils pulseaudio-alsa pavucontrol vlc dunst 

#sudo flatpak install -y spotify
#sudo flatpak install -y kdenlive

sudo systemctl enable lightdm

mkdir -p .config/{bspwm,sxhkd,dunst}

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

printf "\e[1;32mCHANGE NECESSARY FILES BEFORE REBOOT\e[0m"

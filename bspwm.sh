sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose --protocol http,https --latest 10 -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

yay -S --noconfirm auto-cpufreq polybar ttf-unifont siji
sudo systemctl enable --now auto-cpufreq

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm --needed xorg light-locker lightdm bspwm sxhkd xfce4-terminal picom nitrogen lxappearance dmenu thunar simplescreenrecorder alsa-utils pulseaudio pulseaudio-alsa pavucontrol vlc dunst

sudo systemctl enable lightdm

mkdir -p .config/{bspwm,sxhkd,dunst,polybar}

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

printf "\e[1;32mCHANGE NECESSARY FILES BEFORE REBOOT\e[0m"

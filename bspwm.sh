sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose --protocol http,https --latest 10 -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm --needed xorg-server slock lightdm bspwm sxhkd st picom xwallpaper lxappearance-gtk3 dmenu pcmanfm simplescreenrecorder alsa-utils pulseaudio pulseaudio-alsa pavucontrol vlc dunst

yay -S --noconfirm polybar ttf-unifont google-chrome mugshot qogir-gtk-theme qogir-icon-theme auto-cpufreq timeshift timeshift-autosnap ttf-ms-fonts
sudo systemctl enable --now auto-cpufreq

sudo systemctl enable lightdm

git clone https://github.com/CoolnsX/repos_scripts.git
git clone https://github.com/CoolnsX/dotfiles.git
cd dotfiles

printf "\e[1;32mCOPY THESE NECESSARY FILES BEFORE REBOOT\e[0m"

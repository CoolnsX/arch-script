sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --verbose --protocol http,https --latest 10 -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si --noconfirm

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm --needed xorg-server slock bspwm sxhkd picom ttf-roboto xwallpaper lxappearance-gtk3 pcmanfm simplescreenrecorder alsa-utils pulseaudio pulseaudio-alsa pavucontrol vlc dunst

paru -S --noconfirm polybar ly ttf-unifont google-chrome mugshot auto-cpufreq timeshift timeshift-autosnap ttf-ms-fonts
sudo systemctl enable --now auto-cpufreq

sudo systemctl enable ly

git clone https://github.com/CoolnsX/repos_scripts.git
git clone https://github.com/CoolnsX/dotfiles.git
cd dotfiles

printf "\e[1;32mCOPY THESE NECESSARY FILES BEFORE REBOOT\e[0m"

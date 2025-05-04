#!/bin/bash

set -e

### Installation de i3 et SDDM

echo -e "[SilverOs] Installation des paquets i3"
sudo apt update
sudo apt install xorg i3 sddm vim dunst rofi unzip polybar dolphin lxappearance libgtk-4-dev fish autorandr python3-venv curl feh -y

# Mettre SDDM par défaut
sudo dpkg-reconfigure sddm

echo -e "[SilverOs] Fin de configuration pour sddm"

echo -e "[SilverOs] Installation de kitty"

### Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n

# Ajout des chemins
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/
sudo ln -s ~/.local/kitty.app/bin/kitten /usr/bin/

mkdir -p ~/.config/kitty

cp dot/kitty/* ~/.config/kitty/

echo -e "[SilverOs] Fin de configuration kitty"

### Font
echo -e "[SilverOs] Installation des fonts"
# Crée le répertoire des polices s'il n'existe pas
mkdir -p ~/.local/share/fonts

# Télécharge l'archive de la police
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip

# Décompresse l'archive directement dans le répertoire des polices
unzip -o ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts
unzip -o ~/.local/share/fonts/NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts

# Supprime l'archive ZIP
rm ~/.local/share/fonts/JetBrainsMono.zip
rm ~/.local/share/fonts/NerdFontsSymbolsOnly.zip

# Recharge le cache des polices
fc-cache -fv

echo -e "[SilverOs] Fin d'installation des fonts"
### fish customisation

echo -e "[SilverOs] Installation et customisation du prompt"
curl -s https://ohmyposh.dev/install.sh | bash -s

export PATH=$PATH:$HOME/.local/bin

mkdir -p ~/.config/oh-my-posh/
mkdir -p ~/.config/fish/

cp dot/oh-my-posh/* ~/.config/oh-my-posh/
cp dot/fish/* ~/.config/fish/

# Changement du shell
chsh -s /usr/bin/fish

echo -e "[SilverOs] Fin configuration prompt"
# font pout fish (à la mano pour l'instant)
# oh-my-posh font install meslo

### Wallpaper
echo -e "[SilverOs] Ajout du wallpaper"
mkdir -p ~/.config/wallpapers/
cp dot/wallpapers/* ~/.config/wallpapers/

### install picom
echo -e "[SilverOs] Installation et build de picom"
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev cmake -y

git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

mkdir -p ~/.config/picom
cp dot/picom.conf ~/.config/picom/

echo -e "[SilverOs] Fin build de picom"

### Config i3
echo -e "[SilverOs] Config i3"
mkdir -p ~/.config/i3/
cp dot/i3/config ~/.config/i3/

### config polybar
echo -e "[SilverOs] Config polybar"

mkdir -p ~/.config/polybar
cp dot/polybar/* ~/.config/polybar/

chmod +x ~/.config/polybar/launch.sh

### brave
echo -e "[SilverOs] Installation de brave"
curl -fsS https://dl.brave.com/install.sh | sh

echo -e "[SilverOs] Fin installation de brave"

### Install btop
echo -e "[SilverOs] Installation de Btop"
wget https://github.com/aristocratos/btop/releases/download/v1.4.2/btop-x86_64-linux-musl.tbz
tar -xvf btop-x86_64-linux-musl.tbz
cd btop

sudo make install
sudo make setcap
sudo make setuid

# Custom theme btop
cp dot/btop/* ~/.config/btop/themes/

echo -e "[SilverOs] Fin installation de Btop"

### Rofi
echo -e "[SilverOs] Config rofi"
mkdir -p ~/.config/rofi
cp -r dot/rofi/* ~/.config/rofi/

### i3lock
echo -e "[SilverOs] Installation de i3lock-color"
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libgif-dev -y
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
cd ../
cp dot/local/bin/lock.sh ~/.local/bin/lock.sh
chmod +x ~/.local/bin/lock.sh
echo -e "[SilverOs] Fin install i3lock-color"


### Install catppucin theme
echo -e "[SilverOs] Installation des themes"
# GTK
sudo apt install sassc gtk2-engines-murrine gnome-themes-extra
mkdir -p ~/.themes

unzip -o dot/themes/Catppuccin-Dark-Macchiato-BL-MB.zip -d ~/.themes/

# qt5 et qt6
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes 
echo 'export QT_STYLE_OVERRIDE=kvantum' >> ~/.profile
mkdir -p ~/.config/Kvantum

unzip -o dot/themes/catppuccin-macchiato-lavender.zip -d ~/.config/Kvantum

echo -e "[SilverOs] Fin install des themes"

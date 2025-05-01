#!/bin/bash
### Installation de i3 et SDDM

sudo apt update
sudo apt install xorg i3 sddm dunst rofi kitty unzip polybar lxappearance libgtk-4-dev fish autorandr python3-venv curl feh -y

# Mettre SDDM par défaut
sudo dpkg-reconfigure sddm

# Crée le répertoire des polices s'il n'existe pas
mkdir -p ~/.local/share/fonts

# Télécharge l'archive de la police
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

# Décompresse l'archive directement dans le répertoire des polices
unzip -o ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts

# Supprime l'archive ZIP
rm ~/.local/share/fonts/JetBrainsMono.zip

# Recharge le cache des polices
fc-cache -fv

### fish customisation
curl -s https://ohmyposh.dev/install.sh | bash -s

export PATH=$PATH:$HOME/.local/bin

mkdir -p ~/.config/oh-my-posh/
cp dot/oh-my-posh/* ~/.config/oh-my-posh/

# Mettre oh-my-posh en shell
cat << 'EOF' >> ~/.bashrc
eval "$(oh-my-posh init --config '~/.config/oh-my-posh/cattpuccin-macchiato.json' bash)"
EOF

# font pout fish
oh-my-posh font install meslo


### install picom
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev cmake -y

git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

mkdir -p ~/.config/picom
cp dot/picom.conf ~/.config/picom/


### Kitty customisation
kitty +kitten themes

#rofi
git clone https://github.com/adi1090x/rofi

rofi -show drun -theme ~/.config/rofi/launchers/type-x/style-x.rasi # à mettre dans le exec de i3 depuis le binding de la key

# Install catppucin theme
sudo apt install sassc gtk2-engines-murrine gnome-themes-extra
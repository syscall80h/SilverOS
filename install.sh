#!/bin/bash
### Installation de i3 et SDDM

sudo apt update
sudo apt install xorg i3 sddm vim dunst rofi alacritty unzip polybar dolphin lxappearance libgtk-4-dev fish autorandr python3-venv curl feh -y

# Mettre SDDM par défaut
sudo dpkg-reconfigure sddm

### Alacrity customisation
mkdir -p ~/.config/alacritty/
cp dot/alacritty/* ~/.config/alacritty/

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

### fish customisation
curl -s https://ohmyposh.dev/install.sh | bash -s

export PATH=$PATH:$HOME/.local/bin

mkdir -p ~/.config/oh-my-posh/
cp dot/oh-my-posh/* ~/.config/oh-my-posh/

# Mettre oh-my-posh en shell
cat << 'EOF' >> ~/.bashrc
eval "$(oh-my-posh init --config '~/.config/oh-my-posh/cattpuccin-macchiato.json' bash)"
EOF

# font pout fish (à la mano pour l'instant)
# oh-my-posh font install meslo

### Wallpaper
mkdir -p ~/.config/wallpapers/
cp dot/wallpapers/* ~/.config/wallpapers/

### install picom
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev cmake -y

git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

mkdir -p ~/.config/picom
cp dot/picom.conf ~/.config/picom/

### Config i3
mkdir -p ~/.config/i3/
cp dot/i3/config ~/.config/i3/

### config polybar
mkdir -p ~/.config/polybar
cp dot/polybar/* ~/.config/polybar/

chmod +x ~/.config/polybar/launch.sh

### brave
curl -fsS https://dl.brave.com/install.sh | sh

# Install catppucin theme
sudo apt install sassc gtk2-engines-murrine gnome-themes-extra
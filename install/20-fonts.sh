#!/bin/bash

# Install Hack font
mkdir -p ~/.local/share/fonts/tff

# Delete possible old versions.
rm -f "$HOME/.local/share/fonts/Hack Regular Nerd Font Complete Mono.ttf"

# Get the latest version
LOCATION="$(curl -s -L -o /dev/null -w %\{url_effective\} 'https://github.com/ryanoasis/nerd-fonts/releases/latest')"
VERSION="${LOCATION##*/}"

echo "[+] Installing TTF Hack Nerd version $VERSION"
curl -s -L -o /tmp/hack.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/Hack.zip"
unzip -q -o /tmp/hack.zip "Hack Regular Nerd Font Complete Mono.ttf" -d ~/.local/share/fonts/ttf

# Clear font cache
fc-cache -f

# Set Hack Nerd font as default monospace font.
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack Nerd Font Mono 10'


#!/bin/bash

# Stop if packer is already installed.
if [[ -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
  echo "[+] Packer already installed."
  exit 0
fi

# Install Packer
git clone -q --depth 1 https://github.com/wbthomason/packer.nvim\
 "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

echo "[+] Packer is now installed."

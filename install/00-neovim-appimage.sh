#!/bin/bash

install_linux() {
  echo "[+] Installing for Linux..."

  # Download into user bin folder.
  mkdir -p "$HOME/.bin"
  curl -o "$HOME/.bin/nvim" -L "$URL"
  chmod +x "$HOME/.bin/nvim"

  # Make sure user bin folder is in the path.
  if [[ "$PATH" =~ (.*:)*$HOME/.bin:?(.*:)* ]]; then
    echo "[+] $HOME/.bin already in the path."
  else
    echo "[!] $HOME/.bin not yet found in the path. Adding..."

    # Add the .bin folder to the user PATH
    cat << EOF >> "$HOME/.profile"
# Added by NeoVim config
export PATH="$HOME/.bin:\$PATH"
EOF

    # Source new profile.
    source "$HOME/.profile"
  fi
}

# Find the correct OS.
case "$(uname -s)" in
  Linux)
    URL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
    install_linux
    ;;
  Darwin)
    URL="https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz"
    install_macos
    ;;
  *)
    echo "[!] Operating system not supported."
    exit 1
esac

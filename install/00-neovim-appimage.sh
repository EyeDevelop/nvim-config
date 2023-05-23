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

    # If the user uses ZSH, put in ~/.zprofile
    # Otherwise, default to ~/.profile
    shell_name="$(basename "$SHELL")"
    if [[ "$shell_name" == "zsh" ]]; then
      profile_file="$HOME/.zprofile"
    else
      profile_file="$HOME/.profile"
    fi

    {
      echo '# Added by Nvim config.'
      echo "export PATH=\"$HOME/.bin:\$PATH\""
    } >> "$profile_file"

    # Source new profile.
    echo "[+] To have Nvim in the path, start a new shell or run:"
    echo "[+] source $profile_file"
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

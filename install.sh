#!/bin/bash

# Get the absolute path to this script.
SCRIPT_PATH="$(realpath "$0")"
SCRIPT_PATH="$(dirname "$SCRIPT_PATH")"

# Execute everything in the install directory.
for install_script in "$SCRIPT_PATH"/install/*.sh; do
    echo "[+] Running $install_script"
    /bin/bash "$install_script"
done

# Done.
echo "[+] All is installed."

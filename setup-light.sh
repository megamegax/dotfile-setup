#!/usr/bin/env bash

# Get the directory of this script, so all paths work regardless of where you run it from
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Script directory: $SCRIPT_DIR"

#======================Run setup scripts===============  
"$SCRIPT_DIR/setup/apt-install.sh" # install brew and apps
"$SCRIPT_DIR/setup/create-default-folders.sh"

zsh
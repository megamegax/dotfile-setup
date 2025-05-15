#!/usr/bin/env bash

# Source the helpers file to get access to the functions
source ./setup/helpers.sh

#======================Run setup scripts===============  
./setup/brew-install.sh # install brew and apps
setup-stow
setup-jvm
setup-oh-my-zsh
./setup/mac-settings.sh # optional
set-background # optional

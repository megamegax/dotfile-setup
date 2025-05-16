#!/usr/bin/env bash

# File paths (relative to script location)
APPS_FILE="./setup/applications"
PKGS_FILE="./setup/packages"
FONTS_FILE="./setup/fonts"

# Install Homebrew if missing
install_brew() {
    if ! command -v brew &> /dev/null; then
        echo "🍺 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /$HOME/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
        # For testing in container
        echo >> /root/.bashrc
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo "✅ Homebrew already installed"
    fi
}

# Install items from file
install_from_file() {
    local file=$1
    local install_cmd=$2
    
    if [[ ! -f "$file" ]]; then
        echo "⚠️ Missing file: $file"
        return 1
    fi
    
    echo "📦 Installing from $file:"
    while IFS= read -r line; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" == \#* ]] && continue
        
        echo "   → $line"
        if ! eval "$install_cmd $line"; then
            echo "❌ Failed to install: $line"
        fi
    done < "$file"
}

# Prompt user for confirmation
prompt_install() {
    read -p "Install $1? [y/n] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Main installation flow
main() {
    install_brew
    brew tap sdkman/tap
    brew update
    setup-stow
    if prompt_install "applications"; then
        install_from_file "$APPS_FILE" "brew install --cask"
    fi

    if prompt_install "packages"; then
        install_from_file "$PKGS_FILE" "brew install"
    fi

    if prompt_install "fonts"; then
        install_from_file "$FONTS_FILE" "brew install --cask"
    fi

    setup-jvm
    setup-oh-my-zsh
    
# Mac detection: only run Mac-specific things if osascript exists
if command -v osascript >/dev/null 2>&1; then
  "$SCRIPT_DIR/setup/mac-settings.sh" # optional
  set-background # optional
else
  echo "Not MacOS, skipping Mac-specific setup..."
fi

    echo "🎉 Installation using Homebrew is complete."
}

setup-stow() {
          (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> $HOME/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
        # For testing in container
        echo >> /root/.bashrc
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  # Check if stow is present, install if it's missing
  if test ! $(which stow); then
    echo "Installing GNU Stow"
    brew install stow
    echo "🐐 Stowing dotfiles..."
   stow -v --dir=$HOME/dotfiles/configs --target=$HOME zsh git ssh
   echo "🚀 Stow complete!"
  else
   echo "🐐 Stowing dotfiles..."
   stow -v --dir=$HOME/dotfiles/configs --target=$HOME zsh git ssh
   echo "🚀 Stow complete!"
  fi
}

setup-oh-my-zsh() {
# Check if oh-my-zsh is present, install if it's missing
if [ ! -d "$HOME/.oh-my-zsh"  ]; then
    echo "Installing oh my zsh..." 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
  else
    echo "oh my zsh is already installed."
fi
}

setup-jvm() {
          (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> $HOME/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
        # For testing in container
        echo >> /root/.bashrc
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
 export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Check if Java is present, install if it's missing
  if test ! $(which java); then
    echo "Installing JVM 21..." 
    sdk install java 21-tem
  else
    echo "JVM 21 is already installed."
fi
}

set-background() {
if ! command -v osascript >/dev/null 2>&1; then
  echo "Not MacOS, skipping background setting."
  else
    osascript <<EOF
      tell application "Finder"
        set desktop picture to POSIX file "../images/background.jpg"
      end tell
EOF
  fi

}

main
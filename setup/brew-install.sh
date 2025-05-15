#!/usr/bin/env bash

# File paths (relative to script location)
APPS_FILE="applications"
PKGS_FILE="packages"
FONTS_FILE="fonts"

# Install Homebrew if missing
install_brew() {
    if ! command -v brew &> /dev/null; then
        echo "🍺 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew tap sdkman/tap
        brew update
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

    if prompt_install "applications"; then
        install_from_file "$APPS_FILE" "brew install --cask"
    fi

    if prompt_install "packages"; then
        install_from_file "$PKGS_FILE" "brew install"
    fi

    if prompt_install "fonts"; then
        install_from_file "$FONTS_FILE" "brew install --cask"
    fi

    echo "🎉 Installation using Homebrew is complete."
}

main
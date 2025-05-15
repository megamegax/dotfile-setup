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
  else
   echo "🐐 Stowing dotfiles..."
   stow -v --dir=$HOME/dotfiles/configs --target=$HOME zsh git
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
  osascript
  tell application "Finder"
    set desktop picture to POSIX file "../images/background.jpg"
  end tell
}
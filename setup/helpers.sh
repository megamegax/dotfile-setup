setup-stow() {
  # Check if stow is present, install if it's missing
  if test ! $(which stow); then
    echo "Installing GNU Stow"
    brew install stow
  else
   echo "🐐 Stowing dotfiles..."
   stow -v --dir=$HOME/dotfiles --target=$HOME zsh git
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
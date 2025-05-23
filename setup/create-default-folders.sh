export WORK=$HOME/development/work
export HOBBY=$HOME/development/hobby

  (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> $HOME/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
        # For testing in container
        echo >> /root/.bashrc
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

mkdir $HOME/development
mkdir $HOME/development/work
mkdir $HOME/development/hobby

# git clone ....
    echo "🐐 Stowing dotenvs..."
   stow -v --dir=$SCRIPT_DIR/envs --target=$WORK/example example
   echo "🚀 Stow complete!"
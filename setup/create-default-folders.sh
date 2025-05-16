export WORK=$HOME/development/work
export HOBBY=$HOME/development/hobby

mkdir $HOME/development
mkdir $HOME/development/work
mkdir $HOME/development/hobby

# git clone ....
    echo "🐐 Stowing dotenvs..."
   stow -v --dir=$SCRIPT_DIR/envs --target=$WORK/example example
   echo "🚀 Stow complete!"
#!/bin/bash -e

if [ "$(uname)" == "Darwin" ]; then
  brew install ctags 
elif [ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == "\"Ubuntu\"" ]; then
  apt-get install ctags
fi

cp gitconfig-aliases ~/.gitconfig
cp zshrc ~/.zshrc
cp zshrc.dirk ~/.zshrc.dirk

git config --global user.email "dirk@dirkgomez.de"

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm -f ~/.config/nvim/init.vim; ln -s $PWD/nvim/init.vim ~/.config/nvim/init.vim

# nvim
npm list -g bash-language-server || npm install -g bash-language-server

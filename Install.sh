#!/bin/bash -e

if [ "$(uname)" == "Darwin" ]; then
  brew install ctags 
elif [ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == "\"Ubuntu\"" ]; then
  apt-get install ctags
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

cp dirk.zsh ~/.oh-my-zsh/custom/
cp gitconfig-aliases ~/.gitconfig
[[ -f "dirk-nocheckin.zsh" ]] && cp dirk-nocheckin.zsh ~/.oh-my-zsh/custom/

git config --global user.email "dirk@dirkgomez.de"


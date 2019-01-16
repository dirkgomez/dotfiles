#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
  brew install fzf
  VIMRC_FZF="set runtimepath+=/usr/local/opt/fzf"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Linux"
fi


cat << EOF > ~/vimrc
set runtimepath+=~/dotfiles/vim
set packpath+=~/dotfiles/vim/packages
source ~/dotfiles/vim/vimrc.mine
$VIMRC_FZF
EOF

mv ~/vimrc ~/.vimrc


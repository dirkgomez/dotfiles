#!/bin/bash

# create packages directory
START_PLUGINS_DIR=~/.vim/pack/plugins/start
mkdir -p START_PLUGINS_DIR

if [ "$(uname)" == "Darwin" ]; then
  brew install fzf
  VIMRC_FZF="set runtimepath+=/usr/local/opt/fzf"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "Linux"
fi

function git_clone_or_pull {
  if [ ! -d $2 ]
    then
    git clone $1 $2
  else
    (cd $2 && git pull --rebase)
  fi
}

git_clone_or_pull https://github.com/sheerun/vim-polyglot ${START_PLUGINS_DIR}/vim-polyglot



cat << EOF > ~/vimrc
source ~/dotfiles/vim/vimrc.mine
$VIMRC_FZF
EOF

mv ~/vimrc ~/.vimrc


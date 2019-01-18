#!/bin/bash

function git_clone_or_pull {
  echo "Cloning $1"
  if [ ! -d $2 ]
    then
    git clone $3 $1 $2
  else
    (cd $2 && git pull --rebase)
  fi
}

# create packages directory
START_PLUGINS_DIR=~/.vim/pack/plugins/start
mkdir -p START_PLUGINS_DIR

echo "Installing fzf"
if [ "$(uname)" == "Darwin" ]; then
  brew install fzf
  VIMRC_FZF="set runtimepath+=/usr/local/opt/fzf"
elif [ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == "\"Ubuntu\"" ]; then
  git_clone_or_pull https://github.com/junegunn/fzf.git ~/.fzf --"depth 1"
  ~/.fzf/install
fi

git_clone_or_pull https://github.com/sheerun/vim-polyglot ${START_PLUGINS_DIR}/vim-polyglot
git_clone_or_pull https://github.com/python-mode/python-mode.git ${START_PLUGINS_DIR}/python-mode
(cd ${START_PLUGINS_DIR}/python-mode && git submodule update --init --recursive)
git_clone_or_pull https://github.com/mileszs/ack.vim.git ${START_PLUGINS_DIR}/ack.vim
git_clone_or_pull https://github.com/airblade/vim-gitgutter.git ${START_PLUGINS_DIR}/vim-gitgutter
git_clone_or_pull https://github.com/tpope/commentary.git ${START_PLUGINS_DIR}/commentary.git
git_clone_or_pull https://github.com/tpope/surround.git ${START_PLUGINS_DIR}/surround.git
git_clone_or_pull https://github.com/tpope/vim-fugitive.git ${START_PLUGINS_DIR}/vim-fugitive.git
git_clone_or_pull https://github.com/w0rp/ale.git ${START_PLUGINS_DIR}/ale.git



cat << EOF > ~/vimrc
source ~/dotfiles/vim/vimrc.mine
$VIMRC_FZF
EOF

mv ~/vimrc ~/.vimrc


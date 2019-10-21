#!/bin/bash -xv

function git_clone_or_pull {
  echo "Cloning $1"
  if [ ! -d $2 ]
    then
    git clone  --recurse-submodules  $3 $1 $2
  else
    (cd $2 && git pull --rebase; git submodule update --init --recursive)
  fi
}

function echo_to_file_if_not_exists {
  EXISTS=$1
  FILE=$2
  TEXT=$3

  grep -qF -- "$EXISTS" "$FILE" || echo "$TEXT" >> "$FILE"
}

function cat_to_file_if_not_exists {
  SECTION=$1
  TARGET=$2
  SOURCE=$3
  sed "/$SECTION/,/^\[/d" $TARGET
  cat "$SOURCE" >> "$TARGET"
}

if [ "$(uname)" == "Darwin" ]; then
  BASH_CFG="$HOME/.bash_profile"
  brew install ctags
elif [ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == "\"Ubuntu\"" ]; then
  BASH_CFG="$HOME/.bashrc"
  apt-get install ctags
fi

# create packages directory
START_PLUGINS_DIR=~/.vim/pack/plugins/start
mkdir -p START_PLUGINS_DIR

git_clone_or_pull https://github.com/python-mode/python-mode.git ${START_PLUGINS_DIR}/python-mode
git_clone_or_pull https://github.com/mileszs/ack.vim.git ${START_PLUGINS_DIR}/ack
git_clone_or_pull https://github.com/tpope/commentary.git ${START_PLUGINS_DIR}/commentary
git_clone_or_pull https://github.com/morhetz/gruvbox.git ${START_PLUGINS_DIR}/gruvbox
git_clone_or_pull https://github.com/chriskempson/base16-vim ${START_PLUGINS_DIR}/base16-vim
git_clone_or_pull https://github.com/ctrlpvim/ctrlp.vim ${START_PLUGINS_DIR}/ctrlp
git_clone_or_pull https://github.com/davidhalter/jedi-vim.git ${START_PLUGINS_DIR}/jedi.vim

echo_to_file_if_not_exists "\"dotfiles/bash.mine\"" $BASH_CFG "source $HOME/dotfiles/bash.mine"

cat_to_file_if_not_exists '\[alias\]' "$HOME/.gitconfig" "$HOME/dotfiles/gitconfig-aliases"

cat << EOF > $HOME/.vimrc
source ~/dotfiles/vim/vimrc.mine
EOF

#!/bin/bash -e

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

if [ "$(uname)" == "Darwin" ]; then
  brew install ctags pyenv
elif [ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == "\"Ubuntu\"" ]; then
  apt-get install ctags
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi
cp zshrc ~/.zshrc

zsh -c ls

START_PLUGINS_DIR=~/.vim/pack/plugins/start
mkdir -p START_PLUGINS_DIR

#git_clone_or_pull https://github.com/python-mode/python-mode.git ${START_PLUGINS_DIR}/python-mode
git_clone_or_pull https://github.com/prabirshrestha/vim-lsp ${START_PLUGINS_DIR}/vim-lsp
git_clone_or_pull https://github.com/prabirshrestha/async.vim ${START_PLUGINS_DIR}/async
git_clone_or_pull https://github.com/thomasfaingnaert/vim-lsp-snippets ${START_PLUGINS_DIR}/vim-lsp-snippets
git_clone_or_pull https://github.com/thomasfaingnaert/vim-lsp-ultisnips ${START_PLUGINS_DIR}/vim-lsp-ultisnips
git_clone_or_pull https://github.com/honza/vim-snippets ${START_PLUGINS_DIR}/vim-snippets
git_clone_or_pull https://github.com/SirVer/ultisnips ${START_PLUGINS_DIR}/ultisnips
git_clone_or_pull https://github.com/mileszs/ack.vim.git ${START_PLUGINS_DIR}/ack
git_clone_or_pull https://github.com/morhetz/gruvbox.git ${START_PLUGINS_DIR}/gruvbox
git_clone_or_pull https://github.com/chriskempson/base16-vim ${START_PLUGINS_DIR}/base16-vim
git_clone_or_pull https://github.com/ctrlpvim/ctrlp.vim ${START_PLUGINS_DIR}/ctrlp
#git_clone_or_pull https://github.com/davidhalter/jedi-vim.git ${START_PLUGINS_DIR}/jedi.vim
git_clone_or_pull https://github.com/leafgarland/typescript-vim ${START_PLUGINS_DIR}/typescript-vim.vim
git_clone_or_pull https://github.com/Quramy/tsuquyomi ${START_PLUGINS_DIR}/tsuquyomi.vim

cp dirk.zsh ~/.oh-my-zsh/custom/
cp gitconfig-aliases ~/.gitconfig
[[ -f "dirk-nocheckin.zsh" ]] && cp dirk-nocheckin.zsh ~/.oh-my-zsh/custom/

git config --global user.email "dirk@dirkgomez.de"

cat << EOF > $HOME/.vimrc
source ~/dotfiles/vim/vimrc.mine
EOF


#!/bin/zsh
brew install \
            asdf \
            coreutils \
            fzf \
            git \
            gron \
            hugo \
            nvim \
            pipx \
            xsv

asdf plugin-add python
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ -e zshrc.local-nocheckin ] && cp zshrc.local-nocheckin ~/.oh-my-zsh/custom/zshrc.local.zsh
cp zshrc.dirk ~/.oh-my-zsh/custom/zshrc.dirk.zsh

. ./CommonInstall.sh
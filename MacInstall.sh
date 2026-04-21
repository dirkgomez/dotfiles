#!/bin/zsh
brew update && brew upgrade && brew cleanup

brew install \
    coreutils \
    fzf \
    git \
    gron \
    nvim \
    pipx \
    xsv

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ -e zshrc.local-nocheckin ] && cp zshrc.local-nocheckin ~/.oh-my-zsh/custom/zshrc.local.zsh
cp zshrc.dirk ~/.oh-my-zsh/custom/zshrc.dirk.zsh

mkdir -p /Users/dirk/Library/Application\ Support/Code/User/prompts/
cp copilot/prompts/* /Users/dirk/Library/Application\ Support/Code/User/prompts/

cp awesome-copilot/instructions/shell.instructions.md /Users/dirk/Library/Application\ Support/Code/User/prompts/

mkdir -p ~/.copilot/skills/
cp -r awesome-copilot/skills/pytest-coverage ~/.copilot/skills/

. ./CommonInstall.sh

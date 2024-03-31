cp gitconfig ~/.gitconfig
cp gitignore_global ~/.gitignore_global

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ -e zshrc.local-nocheckin ] && cp zshrc.local-nocheckin ~/.oh-my-zsh/custom/zshrc.local.zsh
cp zshrc.dirk ~/.oh-my-zsh/custom/zshrc.dirk.zsh

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


cp gitconfig ~/.gitconfig
cp zshrc ~/.zshrc
cp zshrc.dirk ~/.zshrc.dirk

mkdir -p ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm -f ~/.config/nvim/init.vim; ln -s $PWD/nvim/init.vim ~/.config/nvim/init.vim

# nvim
npm list -g bash-language-server || npm install -g bash-language-server

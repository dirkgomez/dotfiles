cat << EOF > ~/vimrc
set runtimepath+=~/dotfiles/vim
set packpath+=~/dotfiles/vim/packages
source ~/dotfiles/vim/vimrc.mine
EOF
mv ~/vimrc ~/.vimrc

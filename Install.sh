cat << EOF > ~/vimrc
set runtimepath+=~/dotfiles/vim
source ~/dotfiles/vim/vimrc.mine
EOF
mv ~/vimrc ~/.vimrc

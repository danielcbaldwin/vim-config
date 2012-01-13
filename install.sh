#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Backup existing .vim stuff
echo "backing up current vim config\n"
for i in ~/.vim ~/.vimrc ~/.gvimrc ~/.vimbackup; do [ -e $i ] && mv $i $i.old; done

echo "cloning vim config"
git clone --recursive https://github.com/danielcbaldwin/vim-config.git ~/.danielcbaldwin-vim
ln -s ~/.danielcbaldwin-vim/vimrc ~/.vimrc
ln -s ~/.danielcbaldwin-vim ~/.vim
mkdir ~/.vimbackup
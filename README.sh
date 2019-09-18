#!/bin/bash -xe


sudo apt install build-essential cmake python3-dev curl vim silversearcher-ag

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install
ln -sf `pwd`/vimrc ~/.vimrc

vim +PlugInstall! +PlugClean! +qall

cd ~/.vim/plugged/YouCompleteMe

git submodule update --init --recursive

python3 install.py --clang-completer --go-completer --rust-completer

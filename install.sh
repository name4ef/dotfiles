#!/usr/bin/env bash

echo "Installation of dotfiles..."

files="vimrc zshrc Xresources tmux.conf xsession minttyrc ncmpcpp mpdconf \
    xbindkeysrc muttrc taskrc config alacritty.yml"

PWD=$(pwd)

for file in $files
do
    echo ""

    if [ -s ~/.$file ] #exists and has a size greater than zero
    then
        echo "mv ~/.$file ~/.$file.back-$(date +%d%m%y_%H%M%S)"
        mv ~/.$file ~/.$file.back-$(date +%d%m%y_%H%M%S)
    fi

    if [ -L ~/.$file ] #exists and is a symbolic link
    then
        echo "rm ~/.$file"
        rm ~/.$file
    fi

    echo "ln -s $PWD/$file ~/.$file"
    ln -s $PWD/$file ~/.$file

done

if [ ! -s ~/.vim/bundle/Vundle.vim ]
then
    echo "Installation of Vundle..."
    echo ""

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -u vimrc.tmp -c PluginInstall -c qa
fi

touch ~/.taskrc.local
echo ""
echo "Installation done."

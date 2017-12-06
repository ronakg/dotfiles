#!/usr/bin/env bash
#
# Author: Ronak Gandhi <me@ronakg.com>
# Source: https://github.com/ronakg/dotfiles

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

echo "Initializing submodule(s)"
git submodule update --init --recursive

# List of files to be installed
files="zshrc bashrc bash_profile vim tmux tmux.conf screenrc gitconfig inputrc idlerc"

# Directories to install from and backup to
DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
OLDDOTFILES=~/.olddotfiles

echo "Setting up NeoVim directories..."
mkdir ~/.config
ln -snfv $DOTFILES/vim ~/.config/nvim
ln -snfv $DOTFILES/vim/vimrc ~/.config/nvim/init.vim

# ./install clean
if [ "$1" == "clean" ]; then
    echo -e "Cleaning up..."
    for file in $files; do
        if [ -e ~/.$file ]; then
            rm -v ~/.$file
        fi
    done

    echo -e "...done"
    echo -n "${reset}"
    exit 0
fi

# create dotfiles_old in homedir
echo -e "Creating $OLDDOTFILES for backup of any existing dotfiles in ~"
mkdir -p $OLDDOTFILES
echo -e "...done\n"

# change to the my-dot-files directory
echo "Changing to the $DOTFILES directory"
cd $DOTFILES
echo -e "...done\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo -e "Moving any existing dotfiles from ~ to $OLDDOTFILES\n"
for file in $files; do
    if [ -e ~/.$file ]; then
        if [ -d ~/.$file ]; then
            # Move entire folder
            mv -v ~/.$file $OLDDOTFILES/
        else
            mv -v ~/.$file $OLDDOTFILES/.$file
        fi
    fi
done
echo -n "${reset}"

# Create symlinks
echo -e "\nCreating symlinks in home directory."
for file in $files; do
    ln -snfv $DOTFILES/$file ~/.$file
done

git submodule update --init --recursive

echo -e "\nInstalling vim plugins..."
vim -u NONE ./vim/vim-plug.vim +source\ % +PlugUpdate +UpdateRemotePlugins +qall

echo -e "\nSourcing ~/.bashrc"
. ~/.bashrc

# Create undodir for vim persistent undo
mkdir -p ~/.undodir

# Hurray...
echo -e "\n...done"

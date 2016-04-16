#!/bin/bash

# Install script

# Colors
yellow=`tput setaf 3`
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr 0`

# List of files to be installed
files="bashrc bash_profile vimrc vim tmux.conf screenrc bash_aliases gitconfig"

# Directories to install from and backup to
mydotdir=`pwd`
olddotdir=~/.olddotfiles

# ./install clean
echo -n "${red}"
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
echo -n "${reset}"

# create dotfiles_old in homedir
echo -n "${blue}"
echo -e "Creating $olddotdir for backup of any existing dotfiles in ~"
mkdir -p $olddotdir
echo -e "...done\n"

# change to the my-dot-files directory
echo "Changing to the $mydotdir directory"
cd $mydotdir
echo -e "...done\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo -e "Moving any existing dotfiles from ~ to $olddotdir\n"
for file in $files; do
    if [ -e ~/.$file ]; then
        if [ -d ~/.$file ]; then
            # Move entire folder
            mv -v ~/.$file $olddotdir/
        else
            mv -v ~/.$file $olddotdir/.$file
        fi
    fi
done
echo -n "${reset}"

# Create symlinks
echo -n "${green}"
echo -e "\nCreating symlinks in home directory."
for file in $files; do
    ln -sv $mydotdir/$file ~/.$file
done
echo -n "${reset}"

# Install terminfo
echo -n "${red}"
echo -e "\nInstall terminfo"
{ infocmp -1 xterm-256color ; printf "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > xterm-256color.terminfo
tic xterm-256color.terminfo
{ infocmp -1 screen-256color ; printf "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > screen-256color.terminfo
tic screen-256color.terminfo
echo -n "${reset}"

echo -n "${blue}"
echo -e "\nInstalling vim plugins..."
vim +PlugUpdate +qall
echo -n "${reset}"

echo -n "${green}"
echo -e "\nSourcing ~/.bashrc"
. ~/.bashrc
echo -n "${reset}"

# Create undodir for vim persistent undo
mkdir -p ~/.undodir

# Hurray...
echo -e "\n...done"

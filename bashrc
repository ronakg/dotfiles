export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Return if not interactive
[[ $- != *i* ]] && return

# Where are my dotfiles
export DOTFILES=~/dotfiles

# Setup environment, common to both bash and zsh
shopt -s expand_aliases
shopt -s checkwinsize

### Append to the history file
shopt -s histappend
HISTCONTROL=ignoredups:erasedups

# vi mode for readline
set -o vi
bind -m vi-insert '"jj": vi-movement-mode'

# FZF
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

[ -f $DOTFILES/environment.sh ] && . $DOTFILES/environment.sh

[ -f $DOTFILES/bash_prompt ] && . $DOTFILES/bash_prompt

[ -f ~/.bashrc_work ] && . ~/.bashrc_work || true

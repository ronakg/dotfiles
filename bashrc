# Setup environment, common to both bash and zsh
shopt -s expand_aliases

# Return if not interactive
[[ $- != *i* ]] && return

# Where are my dotfiles
export DOTFILES=~/dotfiles

# Source bash completion scripts
for bcfile in $DOTFILES/bash_completion.d/* ; do
  [ -f "$bcfile" ] && . $bcfile
done

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Use case-insensitive filename globbing.
shopt -s nocaseglob

### Append to the history file
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="exit:history:ls"

# LANG
export LANG="C"
export LC_COLLATE="C"
export LC_CTYPE="C"
export LC_MESSAGES="C"
export LC_MONETARY="C"
export LC_NUMERIC="C"
export LC_TIME="C"
export LC_ALL="C"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f $DOTFILES/environment.sh ] && . $DOTFILES/environment.sh
[ -f $DOTFILES/bash_prompt ] && . $DOTFILES/bash_prompt
[ -f $DOTFILES/git-completion.bash ] && . $DOTFILES/git-completion.bash

eval "$(pyenv init -)"
eval "$(rbenv init -)"

# Device specific settings should be in .bashrc_local
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[[ -f ~/.bashrc_work ]] && . ~/.bashrc_work


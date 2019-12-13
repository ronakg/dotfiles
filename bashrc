# Return if not interactive
[[ $- != *i* ]] && return

# Where are my dotfiles
export DOTFILES=~/dotfiles

# Setup environment, common to both bash and zsh
shopt -s expand_aliases
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Use case-insensitive filename globbing.
shopt -s nocaseglob
# Autocorrect typos in path names when using "cd".
shopt -s cdspell

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

export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH:$GOPATH/bin

eval "$(pyenv init -)"
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh" || true

# Device specific settings should be in .bashrc_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[ -f ~/.bashrc_work ] && . ~/.bashrc_work


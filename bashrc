# Return if not interactive
[[ $- != *i* ]] && return

# Where are my dotfiles
export DOTFILES=~/dotfiles

# Setup environment, common to both bash and zsh
shopt -s expand_aliases
shopt -s checkwinsize

### Append to the history file
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="exit"
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# vi mode for readline
set -o vi
bind -m vi-insert '"jj": vi-movement-mode'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f $DOTFILES/environment.sh ] && . $DOTFILES/environment.sh
[ -f $DOTFILES/bash_prompt ] && . $DOTFILES/bash_prompt
[ -f $DOTFILES/git-completion.bash ] && . $DOTFILES/git-completion.bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(thefuck --alias)"

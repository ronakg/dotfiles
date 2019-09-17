# Return if not interactive
[[ $- != *i* ]] && return

# Where are my dotfiles
export DOTFILES=~/dotfiles

# Device specific settings should be in .bashrc_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

# Setup environment, common to both bash and zsh
shopt -s expand_aliases
shopt -s checkwinsize

### Append to the history file
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="exit"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f $DOTFILES/environment.sh ] && . $DOTFILES/environment.sh
[ -f $DOTFILES/bash_prompt ] && . $DOTFILES/bash_prompt
[ -f $DOTFILES/git-completion.bash ] && . $DOTFILES/git-completion.bash

export GOPATH="/rogandhi/go"
export PATH=$PATH:$GOPATH/bin

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH="$HOME/.pyenv/bin:$HOME/.rbenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh" || true

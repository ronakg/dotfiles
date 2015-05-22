alias ls='ls -GFh --color=auto'
alias ll='ls -lGFh'
export GREP_OPTIONS='--color=auto'

export EDITOR=vim
export VISUAL=vim
alias vi=vim

export PS1='\[\e[32m\][\h [\A] \w]$ \[\e[0m\]'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

#ls colors
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

alias newtmux='tmux new -s ${PWD##*/}'

# Source other rc files after this line.
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

# Check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# Handy options
alias ls='ls -GFh'
alias ll='ls -lGFh'
export GREP_OPTIONS='--color=auto'

# Editor
export EDITOR=vim
export VISUAL=vim
alias vi=vim

# Prompt [hostname [time] pwd]
export PS1='\[\e[32m\][\h [\A] \w]$ \[\e[0m\]'

# Moar history for me
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

#ls colors
export CLICOLOR=1

# Shortcut to create new tmux with pwd as session name
alias newtmux='tmux new -s ${PWD##*/}'

# Use vimdiff as git difftool
if command_exists git ; then
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global difftool.prompt false
    alias gitdiff='git difftool'
fi

# Source other rc files after this line.
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

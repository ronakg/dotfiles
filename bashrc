# Check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# Handy options
alias ls='ls -GFh'
export GREP_OPTIONS='--color=auto'

#for *BSD/darwin
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls -Fh --color=auto' || alias ls='ls -GFh'
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin

# Editor
export EDITOR=vim
export VISUAL=vim
alias vi=vim

# Prompt [hostname [time] pwd]
export PS1='\[\e[32m\][\h [\A] \w]$ \[\e[0m\]'

# Moar history for me
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=100000                  # big big history
export HISTFILESIZE=100000              # big big history
shopt -s histappend                     # append to history, don't overwrite it
shopt -s cmdhist                        # Store multi-line commands as one-line in history

# Shortcut to create new tmux with pwd as session name
alias newtmux='tmux -u new -s ${PWD##*/}'

# Use vimdiff as git difftool
if command_exists git ; then
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global difftool.prompt false
    alias gitdiff='git difftool'
fi

# Bind up and down array to do backward and forward history search 
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# ssh with normal terminal
alias myssh='TERM=xterm-256color ssh'

# Source other rc files after this line.
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

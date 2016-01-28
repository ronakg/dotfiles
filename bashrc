# Check if a command exists
command_exists () {
    type $1 &> /dev/null
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#for *BSD/darwin
export CLICOLOR=1
export PATH=/usr/local/git/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=~/tools/lib/:$LD_LIBRARY_PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Editor
export EDITOR=vim
export VISUAL=vim
export CSCOPE_EDITOR=vim

function prompt_command {
    RET_CODE=$?

    PS1='[\e[39m\h \e[38;5;214m\w\e[38;5;252m]'

    if [ $RET_CODE != 0 ]; then
        PS1+='\e[91m$?>\e[0m '
    else
        PS1+='$\e[0m '
    fi

    export PS1
}
export PROMPT_COMMAND=prompt_command

# Moar history for me
HISTSIZE=1000                  # big big history
HISTFILESIZE=1000              # big big history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend                     # append to history, don't overwrite it

# Bind up and down array to do backward and forward history search
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# Device specific settings should be in .bashrc_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

# Use vimdiff as git difftool
if command_exists git ; then
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global difftool.prompt false
    alias gitdiff='git difftool'
fi

export FZF_DEFAULT_COMMAND='if [ -e cscope.files ]; then cat cscope.files; else find ./ -type f ; fi'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_TMUX=0
export FZF_DEFAULT_OPTS='--extended-exact --bind ctrl-f:page-down,ctrl-b:page-up --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:121 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'

function fz {
    $@ $(fzf)
}

# Don't care about Ctrl-s
bind -r '\C-s'
stty -ixon 2>/dev/null

if [ -f ~/.fzf.bash ]; then
   source ~/.fzf.bash
fi

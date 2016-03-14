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

if [ -f ~/.fzf.bash ]; then
   source ~/.fzf.bash
fi

export FZF_DEFAULT_COMMAND='if [ -f cscope.files ]; then cat cscope.files; else find . -type f; fi'
export FZF_TMUX=0
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_OPTS='--extended-exact --color fg:254,bg:235,hl:14,fg+:214,bg+:233,hl+:14 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'

# fz [command pattern] - get result from fzf using pattern and pass it to command
# - Bypass fuzzy finder if there's only one match (--select-1)
# - Exit if there's no match (--exit-0)
function fz {
    alias
    local file
    file=$(fzf --query="${*:2}" --select-1 --exit-0)
    [ -f "$file" ] && "$1" "$file"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$*" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR} "$file"
}

# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

# Don't care about Ctrl-s
bind -r '\C-s'
stty -ixon 2>/dev/null

if [ -f ~/.vim/plugged/gruvbox/gruvbox_256palette.sh ]; then
   source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh > /dev/null 2>&1
fi

# Modeline and Notes {{
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{,}} foldlevel=10 foldlevelstart=10 foldmethod=marker:
# }}

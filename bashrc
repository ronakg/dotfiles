# Check if a command exists
command_exists () {
    type $1 &> /dev/null
}

shopt -s expand_aliases

set -o vi
bind -m vi-insert '"jj": vi-movement-mode'

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

### Append to the history file
shopt -s histappend
HISTCONTROL=ignoreboth:erasedups

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

export FZF_DEFAULT_COMMAND='if [ -f cscope.files ]; then cat cscope.files; else find . -type f; fi'
#export FZF_TMUX=0
#export FZF_COMPLETION_OPTS='+c -i'
export FZF_DEFAULT_OPTS='--exact --reverse --color=fg+:221,hl+:1,hl:202'

if [ -f ~/.fzf.bash ]; then
   source ~/.fzf.bash
fi

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

# cdf - change directory to selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# Don't care about Ctrl-s
bind -r '\C-s'
stty -ixon 2>/dev/null

#if [ -f ~/.vim/plugged/gruvbox/gruvbox_256palette.sh ]; then
   #source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh > /dev/null 2>&1
#fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Modeline and Notes {{
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{,}} foldlevel=10 foldlevelstart=10 foldmethod=marker:
# }}

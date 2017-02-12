# Check if a command exists
command_exists () {
    type $1 &> /dev/null
}

shopt -s expand_aliases
shopt -s checkwinsize

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
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--color=fg+:221,hl+:1,hl:202'

if [ -f ~/.fzf.bash ]; then
   source ~/.fzf.bash
fi

# cdf - change directory to selected file
cdf() {
   local file
   local dir
   file=$(fzf --reverse --height=50 -q "$1") && dir=$(if [ -d $file ]; then
   echo $file; else echo `dirname $file`; fi) && cd "$dir"
}

# Don't care about Ctrl-s
bind -r '\C-s'
stty -ixon 2>/dev/null

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Git log fuzzy searching
glog() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

# Modeline and Notes {{
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{,}} foldlevel=10 foldlevelstart=10 foldmethod=marker:
# }}

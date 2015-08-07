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

# Editor
export EDITOR=vim
export VISUAL=vim
export CSCOPE_EDITOR=vim

# Prompt [hostname [time] pwd]
export PS1='\[\e[32m\][\h \w]$ \[\e[0m\]'

# Moar history for me
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=100000                  # big big history
export HISTFILESIZE=100000              # big big history
shopt -s histappend                     # append to history, don't overwrite it
shopt -s cmdhist                        # Store multi-line commands as one-line in history

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

# Device specific settings should be in .bashrc_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[ -f ~/.bashrc_work ] && . ~/.bashrc_work


export FZF_DEFAULT_COMMAND='if [ -e cscope.files ]; then cat cscope.files; else find ./ -type f ; fi'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_TMUX=0
export FZF_DEFAULT_OPTS='
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:121
  --color info:144,prompt:161,spinner:135,pointer:135,marker:118
'

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

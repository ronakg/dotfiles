# --color=auto is not available everywhere
ls --color &> /dev/null && alias ls="ls -Fh --color" || alias ls="ls -GFh"

# Use neovim if available
if command_exists nvim; then
    alias vim=nvim;
fi

alias ..='cd ..'

alias vi='vim -u ~/.vim/sane_vimrc'

# Shortcut to create new tmux with pwd as session name
alias tmux='tmux -2 -u'
alias newtmux='tmux new -s ${PWD##*/}'
alias e='tmux split-window -h vim $@'

alias mkdir='mkdir -pv'
alias reload="source ~/.bash_profile"
alias gr='rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --hidden --glob "!.git/*" --color "always"'

# fzf vim
alias vip='vim +FZF'
alias vig='vim -c "Gstatus | only | nmap e :q<CR>"'

# Git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gcm='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gcl='git clean -df'
alias diff='git difftool HEAD'
alias gpl='git pull'
alias gps='git push'
alias gemail='git config user.email'
alias gname='git config user.name'
alias groot='cd $(git rev-parse --show-toplevel)'

alias please='sudo -EH $( history -p !! )'

alias histfix='history -n && history | sort -k2 -k1nr | uniq -f1 | sort -n | cut -c8- > ~/.tmp$$ && history -c && history -r ~/.tmp$$ && history -w && rm ~/.tmp$$'  

psgrep() {
  ps aux | grep $@ | grep -v grep
}

cd() {
  builtin cd "$@" && ls
}

cover() {
    local t=$(mktemp -t cover)
    go test -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}

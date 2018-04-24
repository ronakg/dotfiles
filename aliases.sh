# --color=auto is not available everywhere
ls --color &> /dev/null && alias ls="ls -Fh --color" || alias ls="ls -GFh"

# grep doesn't support --color every where either
if grep --color "a" <<<"a" &>/dev/null; then
    alias grep='grep --color=auto'
fi

# Use neovim if available
if command_exists nvim; then
    alias vim=nvim;
fi

alias vi=vim
alias svim='vim -u ~/.vim/sane_vimrc'

# silver searcher
alias ag='ag --noheading --nobreak'

# Shortcut to create new tmux with pwd as session name
alias tmux='tmux -2 -u'
alias newtmux='tmux new -s ${PWD##*/}'

# fzf vim
alias vip='vim +FZF'

alias histfix='history -n && history -w && history -c && history -r'

# Git aliases
alias stash='git stash'
alias stat='git status'
alias add='git add'
alias commit='git commit'
alias checkout='git checkout'
alias branch='git branch'
alias review='git review'
alias diff='git difftool HEAD'
alias apply='git apply'
alias push='git push'
alias pull='git pull'
alias clone='git clone'
alias fetch='git fetch'
alias confemail='git config user.email'
alias confname='git config user.name "Ronak Gandhi"'
alias cdgitroot='cd $(git rev-parse --show-toplevel)'

alias please='sudo -EH $( history -p !! )'
alias fuck='sudo -EH $( history -p !! )'
alias fucking='sudo -EH'

cd() {
  builtin cd "$@" && ls
}

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

alias vi='vim -u ~/.vim/sane_vimrc'

# silver searcher
alias ag='ag --noheading --nobreak'

# Shortcut to create new tmux with pwd as session name
alias tmux='tmux -2 -u'
alias newtmux='tmux new -s ${PWD##*/}'

# fzf vim
alias vip='vim +FZF'

alias histfix='history -n && history -w && history -c && history -r'

# Git aliases
alias add='git add'
alias apply='git apply'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit'
alias diff='git difftool HEAD'
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias review='git review'
alias stash='git stash'
alias stat='git status'
alias confemail='git config user.email'
alias confname='git config user.name'
alias cdgitroot='cd $(git rev-parse --show-toplevel)'

alias please='sudo -EH $( history -p !! )'
alias fuck='sudo -EH $( history -p !! )'
alias fucking='sudo -EH'

cd() {
  builtin cd "$@" && ls
}

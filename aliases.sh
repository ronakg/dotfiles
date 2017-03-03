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

# silver searcher
alias ag='ag --noheading --nobreak'

# Shortcut to create new tmux with pwd as session name
alias tmux='tmux -2 -u'
alias newtmux='tmux new -s ${PWD##*/}'

# ssh with normal terminal
alias myssh="TERM=xterm ssh"

# Create cscope and ctags database
alias create_tags_db="~/dotfiles/create_tags_db.sh"

# fzf vim
alias fvim='vim $(fzf -x)'

# Select which Java to use, see dir /Library/Java/JavaVirtualMachines/ for more options
alias setJdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

alias actvenv='. /nobackup/rogandhi/icsp/venv/bin/activate'

# Git aliases
alias stat='git status'
alias add='git add'
alias commit='git commit'
alias checkout='git checkout'
alias branch='git branch'
alias review='git review'
alias diff='git difftool'
alias push='git push'
alias pull='git pull'
alias clone='git clone'
alias fetch='git fetch'
alias confemail='git config user.email'
alias root='cd $(git rev-parse --show-toplevel)'

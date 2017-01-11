# --color=auto is not available everywhere
ls --color &> /dev/null && alias ls="ls -Fh --color" || alias ls="ls -GFh"

# grep doesn't support --color every where either
if grep --color "a" <<<"a" &>/dev/null; then
    alias grep='grep --color=auto'
fi

alias vi=vim

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

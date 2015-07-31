# --color=auto is not available everywhere
ls --color=auto &> /dev/null && alias ls='ls -Fh --color=auto' || alias ls='ls -GFh'
alias vi=vim

# Shortcut to create new tmux with pwd as session name
alias newtmux='tmux -u new -s ${PWD##*/}'

# ssh with normal terminal
alias myssh='TERM=xterm-256color ssh'

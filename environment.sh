# Setup environment
# Common to both bash and zsh
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Check if a command exists
command_exists () {
    type $1 &> /dev/null
}

export TERM=xterm-256color

# Aliases
[ -f $DOTFILES/aliases.sh ] && . $DOTFILES/aliases.sh

# Device specific settings should be in .bashrc_local
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

# Work related settings should be in .bashrc_work
[ -f ~/.bashrc_work ] && . ~/.bashrc_work

# Git
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false

# Editor
if command_exists nvim; then
    export EDITOR=nvim
    export VISUAL=nvim
    export CSCOPE_EDITOR=nvim
    git config --global mergetool.vimdiff.path nvim
else
    export EDITOR=vim
    export VISUAL=vim
    export CSCOPE_EDITOR=vim
fi

# FZF
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_DEFAULT_OPTS='--reverse --color=fg+:221,hl+:1,hl:202'

# cdf - change directory to selected file
cdf() {
   local file
   local dir
   file=$(fzf --reverse --height=50 -q "$1") && dir=$(if [ -d $file ]; then
   echo $file; else echo `dirname $file`; fi) && cd "$dir"
}

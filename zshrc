# Where are my dotfiles
DOTFILES=~/dotfiles

# Setup environment, common to both bash and zsh
[ -f $DOTFILES/setup_env.sh ] && . $DOTFILES/setup_env.sh

# FZF
if [ -f ~/.fzf.zsh ]; then
   . ~/.fzf.zsh
fi

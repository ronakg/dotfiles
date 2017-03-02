# Where are my dotfiles
export DOTFILES=~/dotfiles

# Setup environment, common to both bash and zsh
[ -f $DOTFILES/environment.sh ] && . $DOTFILES/environment.sh

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
#setopt IGNORE_EOF
setopt PROMPT_SUBST

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# history
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY

setopt COMPLETE_ALIASES

[ -f $DOTFILES/zsh_prompt ] && . $DOTFILES/zsh_prompt

# FZF
if [ -f ~/.fzf.zsh ]; then
   . ~/.fzf.zsh
fi

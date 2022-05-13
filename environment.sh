#!/bin/bash

# Setup environment
# Common to both bash and zsh
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Check if a command exists
command_exists () {
    command -v $1 &> /dev/null
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    [ -f $DOTFILES/linux-gnu.sh ] && . $DOTFILES/linux-gnu.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f $DOTFILES/macos.sh ] && . $DOTFILES/macos.sh
else
    echo "New OS Found"
fi

# Aliases
[ -f $DOTFILES/aliases.sh ] && . $DOTFILES/aliases.sh

# Extract stuff from any filetype
extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

# Editor
if command_exists nvim; then
    export EDITOR=nvim
    export VISUAL=nvim
    export CSCOPE_EDITOR=nvim
    export MANPAGER="nvim +Man! -c ':set signcolumn= | IndentLinesDisable'"
else
    export EDITOR=vim
    export VISUAL=vim
    export CSCOPE_EDITOR=vim
    export MANPAGER="/bin/sh -c \"col -bx | vim -c ':set ft=man nomod nonu nolist noma signcolumn=' -R -\""
fi

export HOMEBREW_INSTALL_CLEANUP=1

# FZF
if command_exists fzf; then
    if command_exists fd; then
        export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
    elif command_exists rg; then
        # --files: List files that would be searched but do not search
        # --no-ignore: Do not respect .gitignore, etc...
        # --hidden: Search hidden files and folders
        # --follow: Follow symlinks
        # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
        export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    elif command_exists ag; then
        export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    fi

    export FZF_DEFAULT_OPTS="
    --ansi
    --layout=reverse
    --info=inline
    --height=60%
    --multi
    --exact
    --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
    --preview-window :wrap
    --color=fg:#ebdbb2,bg:#282828,hl:#8ec07c
    --color=fg+:#b8bb26,bg+:#1d2021,hl+:#fb4934
    --color=info:#afaf87,prompt:#fe9019,pointer:#fb4934
    --color=marker:#b8bb26,spinner:#fe9019,header:#87afaf
    --prompt='∼ ' --pointer='▶' --marker='✓'
    --bind '?:toggle-preview'
    --bind 'ctrl-a:select-all'
    --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
    --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
    --bind 'ctrl-v:execute(code {+})'
    --bind 'btab:up'
    --bind 'tab:down'
    "

    export FZF_COMPLETION_TRIGGER='--'
fi

# Sync from an upstream branch
function git_sync_from() {
    git fetch
    git pull --rebase origin $1
}

# fshow_preview - git commit browser with previews
alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(magenta)%cr %C(white)➜  %C(blue)%an <%ae> %C(green)%GK%C(auto)" "$@"'
gl() {
    local _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    local _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"

    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" \
        --header "enter to view, alt-y to copy hash" \
        --bind "enter:execute:$_viewGitLogLine   | less -R" \
        --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

export HOMEBREW_AUTO_UPDATE_SECS=86400

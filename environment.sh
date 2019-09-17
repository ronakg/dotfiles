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
    export MANPAGER='nvim +Man!'
else
    export EDITOR=vim
    export VISUAL=vim
    export CSCOPE_EDITOR=vim
    export MANPAGER="/bin/sh -c \"col -bx | vim -c ':set ft=man nomod nonu nolist noma' -R -\""
fi

export HOMEBREW_INSTALL_CLEANUP=1

# FZF
if command_exists fzf; then
    if command_exists rg; then
        # --files: List files that would be searched but do not search
        # --no-ignore: Do not respect .gitignore, etc...
        # --hidden: Search hidden files and folders
        # --follow: Follow symlinks
        # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    elif command_exists ag; then
        export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    fi

    _gen_fzf_default_opts() {
        local color01='#2D3B4D'
        local color00='#1F2430'
        local color02='#517F8D'
        local color03='#6C8B91'
        local color04='#CBCCC6'
        local color05='#a1a19a'
        local color06='#e6e6dc'
        local color07='#fafaf8'
        local color08='#ff5a67'
        local color09='#f08e48'
        local color0A='#BAE67E'
        local color0B='#7fc06e'
        local color0C='#F28779'
        local color0D='#FFCC66'
        local color0E='#9a70a4'
        local color0F='#5CCFE6'

        export FZF_DEFAULT_OPTS=" --reverse
        --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
        --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
        --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0F
        "

    }

_gen_fzf_default_opts
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
    local _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" \
        --header "enter to view, alt-y to copy hash" \
        --bind "enter:execute:$_viewGitLogLine   | less -R" \
        --bind "alt-y:execute:$_gitLogLineToHash | xclip"
    }

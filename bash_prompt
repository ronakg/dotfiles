#!/bin/bash

if tput setaf 1 &> /dev/null; then
    tput sgr0; # reset colors
    bold=$(tput bold);
    reset=$(tput sgr0);
    black=$(tput setaf 235)
    red=$(tput setaf 1)
    green=$(tput setaf 142)
    yellow=$(tput setaf 214)
    blue=$(tput setaf 66)
    purple=$(tput setaf 175)
    cyan=$(tput setaf 37)
    gray=$(tput setaf 246)
    white=$(tput setaf 223)
    orange=$(tput setaf 208)
else
    bold='';
    reset="\e[0m";
    black="\e[1;30m";
    blue="\e[1;34m";
    cyan="\e[1;36m";
    green="\e[1;32m";
    orange="\e[1;33m";
    purple="\e[1;35m";
    red="\e[1;31m";
    violet="\e[1;35m";
    white="\e[1;37m";
    yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "$USER" == "root" ]]; then
    userStyle="$red";
else
    userStyle="$orange";
fi;

# Highlight the hostname when connected via SSH.
if [[ "$SSH_TTY" ]]; then
    hostStyle="$green";
else
    hostStyle="$gray";
fi;

dirStyle="$cyan"

function prompt_command {
    ret_code=$?
    # Are we running in a shell invoked from Vim?
    if [[ "$VIM" ]]; then
        vim="(Vim) "
    else
        vim=""
    fi

    # Did last command return non-zero value?
    if [ "$ret_code" != 0 ]; then
        ret_str="\[$red\]$ret_code>"
    else
        ret_str="\[$green\]$"
    fi

    PS1="\[$userStyle\]\u \[$reset\]at \[$hostStyle\]\H \[$reset\]in \[$dirStyle\]\w\n\[$yellow\]$vim$ret_str\[$reset\] "
}
export PROMPT_COMMAND=prompt_command
export PS2="\[$blue\]continue -> \[$reset\]"

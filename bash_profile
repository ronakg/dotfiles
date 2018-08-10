export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

TZ='America/Los_Angeles'; export TZ

source ~/.git-completion.bash

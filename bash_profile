export HISTCONTROL=ignoreboth:erasedups

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

export GOPATH="/Users/rogandhi/work/go"
export PATH=$PATH:$GOPATH/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/rogandhi/.sdkman"
[[ -s "/Users/rogandhi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/rogandhi/.sdkman/bin/sdkman-init.sh"

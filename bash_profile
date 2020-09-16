export GOPATH=$HOME/go
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH:$GOPATH/bin

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/rogandhi/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

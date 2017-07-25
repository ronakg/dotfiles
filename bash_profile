export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/sbin:$PATH"

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

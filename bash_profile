export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

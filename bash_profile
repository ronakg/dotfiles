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

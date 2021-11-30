export PATH=/usr/local/bin:$HOME/go/bin:$HOME/.local/bin:/usr/local/sbin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

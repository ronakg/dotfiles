if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

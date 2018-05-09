if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home'  | awk '{print $3}')
TZ='America/Los_Angeles'; export TZ

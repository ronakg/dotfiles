if [ -f ~/.bash_profile_work ]
then
    . ~/.bash_profile_work
fi

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

for file in ~/.{bash_prompt,}; do
    echo "Sourcing $file"
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

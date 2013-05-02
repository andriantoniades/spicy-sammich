set keymap vi
# put in home dir
if [ -f ~/.bashrc ];
then
    source ~/.bashrc
fi

# Infinite bash history
HISTFILESIZE=""

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

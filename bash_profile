set editing-mode vi
set keymap vi

# load bashrc
if [ -f ~/.bashrc ];
then
    source ~/.bashrc
fi

# append to history instead of overriding
shopt -s histappend
# pseudo-infinite bash history
HISTFILESIZE=1000000
HISTSIZE=1000000

# rbenv setup to enable shims and autocompletion
eval "$(rbenv init -)"


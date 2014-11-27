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

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


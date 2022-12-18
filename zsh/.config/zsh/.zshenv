# Add local binaries to PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Add homebrew bin folder to PATH if installed
if [ -d "/opt/homebrew/bin" ]
then
    typeset -U path PATH
    path=(/opt/homebrew/bin $path)
    export PATH
fi

# Common variables
export EDITOR="nvim"
export PAGER="less"

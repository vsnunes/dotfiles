# Aliases
alias g="git"
alias lg="lazygit"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vim="nvim"
alias v="nvim"
alias d="docker"
alias ..="cd .."
alias bc="bc -l"
alias tf="terraform"
alias kc="kubectl"
alias nb="newsboat"

alias -s md="nvim"
alias -s json="jq"

if command -v "eza" > /dev/null 2>&1; then
    alias ls="eza --icons"
    alias ll="eza --icons -lah"
    alias lt="eza --icons --tree"
    alias llt="eza --icons --tree -lah"
else
    alias ls="ls --color"
    alias ll="ls --color -lah"
fi

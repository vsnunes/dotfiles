if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

# Command completion
autoload -Uz compinit
compinit

# Prevent commands starting with space from being written to the history
setopt HIST_IGNORE_SPACE

# fzf completion and key bindings
if command -v "fzf" > /dev/null 2>&1; then
    source $ZDOTDIR/shell/fzf-completion.zsh
    source $ZDOTDIR/shell/fzf-key-bindings.zsh
fi

if command -v "navi" > /dev/null 2>&1; then
    source $ZDOTDIR/shell/navi.zsh
fi

# Plugins
zvm_after_init_commands+=("source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh")
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme

# Aliases
alias g="git"
alias gl="lazygit"
alias ls="ls --color"
alias ll="ls --color -lah"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vim="nvim"
alias d="docker"
alias ..="cd .."
alias bc="bc -l"

alias -s md="nvim"
alias -s json="jq"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# compinit -> advanced autocompletion abilities
autoload bashcompinit
autoload -Uz compinit colors promptinit
bashcompinit
compinit
colors
promptinit

BACKGROUND_JOBS="%(1j.%F{red}[↺ %j] %f.)"
PS1="$BACKGROUND_JOBS%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[cyan]%}%1d%{$fg[red]%}]%{$reset_color%}$%b ❯ "

setopt autocd # Automatically cd into the typed directory

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTCONTROL=ignoreboth # ignore commands start with space or consecutive duplicates
setopt inc_append_history

# vim mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
# block for all modes except insert where it's beam
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/utils.zsh

# fzf completion and key bindings
if command -v "fzf" > /dev/null 2>&1; then
    source $ZDOTDIR/shell/fzf-completion.zsh
    source $ZDOTDIR/shell/fzf-key-bindings.zsh
fi

if command -v "navi" > /dev/null 2>&1; then
    source $ZDOTDIR/shell/navi.zsh
fi

# Kubernetes
if command -v "kubectl" > /dev/null 2>&1; then
  source $ZDOTDIR/shell/kubectl.zsh
fi

if command -v "helm" > /dev/null 2>&1; then
  source <(helm completion zsh)
fi

# Syntax highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh

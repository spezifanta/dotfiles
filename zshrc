export PATH=$HOME/bin:/Users/fanta/Library/Python/3.9/bin:$PATH

export EDITOR=vim
export VISUAL=vim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history append_history autocd extendedglob
unsetopt beep
bindkey -e
bindkey '^R' history-incremental-search-backward

autoload -Uz compinit colors
compinit
colors

PROMPT=$'\n'"%{$fg[green]%}%n@%m:%{$reset_color%}%d"$'\n'"%# "
RPROMPT="[%*]"

source $HOME/.aliases
source $HOME/.functions
source $HOME/.z.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
#8bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fanta/.zshrc'

autoload -Uz compinit
autoload colors; colors
compinit
# End of lines added by compinstall

# fanta
export PATH=$PATH:$HOME/bin

PROMPT=$'\n'"%{$fg[green]%}%n@%m:%{$reset_color%}%d"$'\n'"%# "
RPROMPT="[%*]"

source $HOME/.zsh/alias
source $HOME/.zsh/envvars
source $HOME/.zsh/function
source $HOME/.zsh/scripts/z.sh

setopt share_history
setopt append_history
setopt autocd
setopt extendedglob

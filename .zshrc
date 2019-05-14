# The following lines were added by compinstall

zstyle ':completion:*' format 'hmmm.... %d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.hist
HISTSIZE=32333
SAVEHIST=33233
setopt notify
setopt HIST_IGNORE_DUPS

# Functions

# Aliases

alias vi='vim'
alias ll='ls -lartGsh'
alias l='ls -1G'
alias ls='ls -G'
alias tailf='tail -f'

# Colors & prompts

# Colors firs
autoload -U colors && colors

# Define prompt
PS1="%{%F{11}%}%T %f%{%F{9}%}%n%{%F{34}%}@%f%{%F{6}%}%m:%f%{%F{178}%}%~ %%%f "

# Load Prompt and initiate
autoload -U promptinit && promptinit

# Eval rbenv and initial script env variables
eval "$(rbenv init -)"

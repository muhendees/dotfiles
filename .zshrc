# The following lines were added by compinstall

#zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format 'hmmm.... %d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.hist
HISTSIZE=3333
SAVEHIST=3333
setopt notify
setopt HIST_IGNORE_DUPS

#Functions



#Aliases

alias vi='vim'
alias ll='ls -lartGsh'
alias l='ls -1G'
alias ls='ls -G'
alias tailf='tail -f'
#alias macs='emacs-25.3'


#Alias for MongoDB
alias mongostart="sudo mongod -f /opt/local/etc/mongodb/mongod.conf --httpinterface"

#Alias for Phoenix Server start
alias sps='mix phoenix.server'

mongostop_func () {
    local mongopid=`less /opt/local/var/db/mongodb/mongod.lock`;
    if [[ $mongopid =~ [[:digit:]] ]]; then
        sudo kill -15 $mongopid;
        echo mongod process $mongopid terminated;
    else
        echo mongo process $mongopid not exist;
    fi

}

alias mongostop="mongostop_func"

#colors & prompts

autoload -U colors && colors

PS1="%{%F{11}%}%T %f%{%F{9}%}%n%{%F{34}%}@%f%{%F{6}%}%m:%f%{%F{178}%}%~ %%%f "

#goodone
#PS1="%{$fg_bold[silver]%}%T %{$fg_no_bold[white]%}%n%{$fg_no_bold[green]%}@%{$fg_no_bold[red]%}%m %{$fg_no_bold[cyan]%}%~ %{$reset_color%}%% "

#GoodOLDOne
#PS1="%{$fg_bold[black]%}%T %{$fg_bold[green]%}%n%{$fg[yellow]%}@%{$fg[red]%}%m %{$fg_no_bold[cyan]%}%~ %{$reset_color%}%% "


autoload -U promptinit && promptinit




export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

eval "$(rbenv init -)"
export PATH="/usr/local/opt/node@8/bin:$PATH"

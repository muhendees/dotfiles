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

# EDITOR
export EDITOR='/opt/homebrew/bin/emacsclient'


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export GOPATH=$HOME/go
export PATH=$PATH:/Users/javadm/Library/Python/3.9/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.tfenv/bin:/Users/javadm/go/bin
export GOROOT=/usr/local/go
export GOARCH=arm64
export GOOS=darwin

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix switch)/switch.sh"

export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

export HOST=spoon


# GitLab
export GITLAB_USER=javadm
export GITLAB_ACCESS_TOKEN=glpat-MYZRUCkvEAvxfuxNRs5n
export VAULT_ADDR=https://vault.immedia.co:8200
#export VAULT_TOKEN=hvs.w3BuyE20q34PWzt8bumDsckR

# TERRAFORM
export TF_HTTP_USERNAME=$GITLAB_USER
export TF_HTTP_PASSWORD=$GITLAB_ACCESS_TOKEN
export TG_TF_REGISTRY_TOKEN=$GITLAB_ACCESS_TOKEN

#VIRTUALENVWRAPPER
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
export WORKON_HOME="~/ENVS"
source virtualenvwrapper.sh

# Emacs lsp
LSP_USE_PLISTS=true

# Aliases

alias isotime='date -u +"%Y-%m-%d-%H-%M-%S"'
alias vi='vim'
alias ll='ls -lartGsh'
alias l='ls -1G'
alias ls='ls -G'
alias tailf='tail -f'
alias flushDns='dscacheutil -flushcache'
alias netshoot='docker run  -it --entrypoint /bin/bash nicolaka/netshoot'
alias dgit='GIT_TRACE=true GIT_CURL_VERBOSE=true GIT_SSH_COMMAND="ssh -vvv" GIT_TRACE_PACK_ACCESS=true GIT_TRACE_PACKET=true GIT_TRACE_PACKFILE=true GIT_TRACE_PERFORMANCE=true GIT_TRACE_SETUP=true GIT_TRACE_SHALLOW=true git'
alias em='emacsclient -t'
alias gpgactivate='export GPG_TTY=$(tty) && echo "test" | gpg --clearsign'
alias k='kubectl'
alias kgps='kubectl get pods'
alias kgss='kubectl get services'


# AWS RESOURCE QUERY

## NAT GW

natgw ()
{
    local profile="${1:-production}"
    local region="${2:-us-west-2}"

    aws ec2 describe-nat-gateways --query "NatGateways[*].NatGatewayAddresses[*]" --profile $profile --region $region --output table
}


## Describe EC2 instances
ec2filter ()
{
    local profile="${1:-production}"
    local region="${2:-us-west-2}"
    local filter="${3:-*}"
    local output="${4:-table}"

    aws ec2 describe-instances --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, ip_address: PrivateIpAddress, type: InstanceType, state: State.Name}"  --filters "Name=tag:Name,Values=${filter}*" --profile $profile --region $region --output $output
}

ec2filterp ()
{
    local profile="${1:-production}"
    local region="${2:-us-west-2}"
    local filter="${3:-*}"
    local output="${4:-table}"

    aws ec2 describe-instances --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, ip_address: PublicIpAddress, type: InstanceType, state: State.Name}"  --filters "Name=tag:Name,Values=${filter}*" --profile $profile --region $region --output $output
}

ec2desc ()
{
    local profile="${1:-dev}"
    local region="${2:-us-west-2}"
    local output="${3:-table}"
    aws ec2 describe-instances --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, ip_address: PrivateIpAddress, type: InstanceType, state: State.Name}" --profile $profile --region $region --output $output
}

ec2descp ()
{
    local profile="${1:-dev}"
    local region="${2:-us-west-2}"
    local output="${3:-table}"
    aws ec2 describe-instances --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, instance_id: InstanceId, ip_address: PublicIpAddress, type: InstanceType, state: State.Name}" --profile $profile --region $region --output $output
}

# Colors & prompts

# Colors firs
autoload -U colors && colors

# Define prompt
PS1="%{%F{11}%}%T %f%{%F{9}%}%n%{%F{34}%}@%f%{%F{6}%}%m:%f%{%F{178}%}%~ %%%f "

# Load Prompt and initiate
autoload -U promptinit && promptinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=/opt/homebrew/opt/libpq/bin:/home/javadm/bin:$PATH

#[[ -e "/home/javadm/lib/oracle-cli/lib/python3.10/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/javadm/lib/oracle-cli/lib/python3.10/site-packages/oci_cli/bin/oci_autocomplete.sh"

# PYENV

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source /Users/javadm/.docker/init-zsh.sh || true # Added by Docker Desktop
source <(kubectl completion zsh)

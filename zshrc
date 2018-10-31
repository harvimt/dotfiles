#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
zstyle ':prezto:module:prompt' theme 'agnoster'
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


setopt interactive_comments

# Customize to your needs...
if which mvim &> /dev/null; then
    alias vim='mvim -v'
    alias vimdiff='mvim -vd'
fi

export PATH="$PATH:$HOME/pyenvs/flake8.py3.env/bin"

source ~/.zshrc_local
export EDITOR=$(echo =vim)
export VISUAL=${EDITOR}

alias g=git
alias dcp=docker-compose
alias be='bundle exec'
alias mussh='mussh -m 0 -o LogLevel=ERROR'

source ~/.dotfiles/z/z.sh


# ssh as root with password
alias sshrp='ssh -o PreferredAuthentications=password -l root'
if which exa &> /dev/null; then
    alias ls=exa
    alias ll='exa -l'
    alias tree='exa --tree'
else
    alias ll='ls -l'
fi

alias vagrant-destroy-all='vagrant global-status | grep virtualbox | awk '\''{ print $1 }'\'' | xargs -n1 vagrant destroy -f'
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
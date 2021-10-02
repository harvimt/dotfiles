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
if [[ -e ~/Library/Python/2.7 ]]; then
    export PATH="${PATH}:/Users/mharvist/Library/Python/2.7/bin"
fi

alias rebuild-completions='rm -i ${ZDOTDIR:-${HOME:?No ZDOTDIR or HOME}}/.zcompdump && compinit'

source ~/.zshrc_local
export EDITOR=$(echo =vim)
export VISUAL=${EDITOR}

alias g=git
alias dcp=docker-compose
alias be='bundle exec'
alias autosquash='git rebase -i master --autosquash'
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

alias recent-branches='git branch --sort=-committerdate'
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ghc == glasgow haskell compiler
[ -f "/Users/mharvist/.ghcup/env" ] && source "/Users/mharvist/.ghcup/env" # ghcup-env
eval "$(rbenv init -)"

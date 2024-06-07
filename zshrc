#
# Executes commands at the start of an interactive session.
#
# init Homebrew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Init Oh-My-Posh
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh init zsh --config ~/.omp.json)"
else
    # fallback to prezto if oh-my-posh is not installed
    zstyle ':prezto:module:prompt' theme 'agnoster'
fi

source ~/z/z.sh

setopt interactive_comments

# macvim
if which mvim &> /dev/null; then
    alias vim='mvim -v'
    alias vimdiff='mvim -vd'
fi

alias rebuild-completions='rm -i ${ZDOTDIR:-${HOME:?No ZDOTDIR or HOME}}/.zcompdump && compinit'

source ~/.zshrc_local
export EDITOR=$(echo =vim)
export VISUAL=${EDITOR}
export HOMEBREW_NO_ENV_HINTS=yes
export HOMEBREW_NO_AUTO_UPDATE=yes

alias g=git
alias dcp=docker-compose
alias be='bundle exec'

# ssh as root with password
alias sshrp='ssh -o PreferredAuthentications=password -l root'

# setup eza an ls/tree replacement
if which eza &> /dev/null; then
    alias ls=eza
    alias ll='eza -l'
    alias tree='eza --tree'
else
    alias ll='ls -l'
fi

source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ghc == glasgow haskell compiler
[ -f ~/.ghcup/env ] && source ~/.ghcup/env

# if rbenv is installed use it
command -v rbenv && eval "$(rbenv init -)"

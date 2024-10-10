#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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
# Customize to your needs...

. ~/z/z.sh
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

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
alias tf=terraform
alias oc=ocna-connect
alias d=docker
alias dcp=docker-compose
alias dcpr='docker-compose run'

alias ssh-with-pass='ssh -o PasswordAuthentication=yes -o PreferredAuthentications=keyboard-interactive,password -o PubkeyAuthentication=no'

function ruby-exec(){
    if [ -f .kitchen.yml ]; then
        chef exec "$@"
    elif [ -f Gemfile ]; then
        bundle check || bundle install
        bundle exec "$@"
    else
        "$@"
    fi
}

alias be='bundle exec'
alias ruby='ruby-exec ruby'
alias irb='ruby-exec irb'
alias rspec='ruby-exec rspec'
alias rake='ruby-exec rake'

command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - zsh)"
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

#include jq
function jqi(){
    q="$1"
    shift
    for i in $@
    do
        jq $q $i | sponge $i
    done
}
#setup sdkman
if brew list sdkman-cli >/dev/null 2>&1; then
    export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
    [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi
